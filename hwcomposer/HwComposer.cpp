#include <gralloc.h>
#include <hwcomposer.h>
#include <cutils/log.h>
#include <hardware/hardware.h>
#include <linux/fb.h>
#include <sys/ioctl.h>
#include <sys/time.h>
#include <sys/resource.h>
#include <sys/prctl.h>
#include <errno.h>
#include <fcntl.h>
#include <malloc.h>
#include <cutils/atomic.h>
#include <utils/Trace.h>
#include <utils/threads.h>
#include <hardware/hwcomposer.h>
#include <EGL/egl.h>
//#include <ion/ion.h>
#include "hwc_helper.h"
/*
 * Custom HwComposer module for HiSilicon based devices
 *
 * Copyright (C) 2016 Eduardo Alonso
 * Copyright (C) 2016 Honor8Dev
 * Based on 1.0 HwC
 *
 * This software is licensed under the terms of the GNU General Public
 * License version 2, as published by the Free Software Foundation, and
 * may be copied, distributed, and modified under those terms.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 */

static int
hwc_device_open(const struct hw_module_t *module, const char *name, struct hw_device_t **device);


static int
hwc_device_close(struct hw_device_t *dev)
{
    hwc_context_t *ctx = to_ctx(dev);
    if(!ctx) {
	ALOGE("%s: NULL device pointer!", __func__);
	return -1;
    }
    free(ctx);
    return 0;
}

static int
hwc_prepare(struct hwc_composer_device_1 *dev, size_t numDisplays,
	hwc_display_contents_1_t ** displays)
{
    int ret = 0;
    hwc_context_t *ctx = to_ctx(dev);
    if (displays && (displays[0]->flags & HWC_GEOMETRY_CHANGED)) {
	for (size_t i=0 ; i<displays[0]->numHwLayers ; i++) {
	displays[0]->hwLayers[i].compositionType = HWC_FRAMEBUFFER;
        }
    }
    return 0;
}

static int
hwc_set(hwc_composer_device_1_t *dev, size_t numDisplays,
	hwc_display_contents_1_t ** displays)
{
    ATRACE_CALL();
    if (!numDisplays || !displays)
	return 0;

    int ret = 0;
    hwc_context_t *ctx = to_ctx(dev);
    
    hwc_display_contents_1_t *pdis_cont = displays[HWC_DISPLAY_PRIMARY];
    hwc_display_contents_1_t *xdis_cont = displays[HWC_DISPLAY_EXTERNAL];

    //TODO: Implement 'real' code here (the lines below are just for testing purposes)
    //I am aware that it will cause EGL_BAD_DISPLAY
    eglSwapBuffers((EGLDisplay)displays[0]->dpy,
	(EGLSurface)displays[0]->sur);
    return ret;
}

static int
hwc_eventControl(struct hwc_composer_device_1 *dev, int disp, int event, int enabled)
{
    ATRACE_CALL();
    int ret = 0;
    hwc_context_t *ctx = to_ctx(dev);
    if (disp < 0 || disp >= HWC_NUM_DISPLAY_TYPES)
	return -EINVAL;

    switch (event) {
	case HWC_EVENT_VSYNC:
	    if (ctx->vstate.enabled == enabled)
		break;

	    if(ioctl(ctx->fb0, HISIFB_VSYNC_CTRL, &enabled) < 0) {
		ALOGE("%s: vsync ctrl failed! enabled=%d : %s", __func__, enabled, strerror(errno));
		ret = -1;
	    }
	    else 
		ctx->vstate.enabled = true;

	    break; 

	default:
	    return -EINVAL;
    }
    return ret;
}


static int
hwc_blank (struct hwc_composer_device_1 *dev, int disp, int blank)
{
    hwc_context_t *ctx = to_ctx(dev);
    int ret, arg;

    arg = blank ? FB_BLANK_POWERDOWN : FB_BLANK_UNBLANK;
    ret = ioctl(ctx->fb0, FBIOBLANK, arg);
    return ret;
}

static int
hwc_query(struct hwc_composer_device_1* dev, int what, int *value)
{
    hwc_context_t *ctx = to_ctx(dev);
    int refreshRate = 60;
    switch (what) {
    case HWC_BACKGROUND_LAYER_SUPPORTED:
	value[0] = 1;
	break;
    case HWC_VSYNC_PERIOD:
	*value = 1000000000 / refreshRate;
	break;
    case HWC_DISPLAY_TYPES_SUPPORTED:
	*value = HWC_DISPLAY_PRIMARY_BIT;//Should be fine by now
	break;
    default:
	return -EINVAL; //Unsupported
    }
    return 0;
}

static void
hwc_dump(struct hwc_composer_device_1 *dev, char *buff, int buff_len)
{
    ALOGD("%s", __func__);
}

static int
hwc_getDisplayConfigs(struct hwc_composer_device_1* dev, int disp, 
    uint32_t* configs, size_t* numConfigs) {

    int ret = 0;
    hwc_context_t* ctx = to_ctx(dev);
    
    if (*numConfigs == 0)
	return 0;

    switch(disp) {
	case HWC_DISPLAY_PRIMARY:
	    configs[0] = 0;
	    *numConfigs = 1;
    
	ret = 0;
	break;
	case HWC_DISPLAY_EXTERNAL:
	    ret = -1;
	break;
    }
    return ret;
}

static int
hwc_getDisplayAttributes(struct hwc_composer_device_1* dev, int disp,
    uint32_t config, const uint32_t* attributes, int32_t* values) {

    hwc_context_t* ctx = to_ctx(dev);

    static const uint32_t DISPLAY_ATTRIBUTES[] = {
	HWC_DISPLAY_VSYNC_PERIOD,
	HWC_DISPLAY_WIDTH,
	HWC_DISPLAY_HEIGHT,
	HWC_DISPLAY_DPI_X,
	HWC_DISPLAY_DPI_Y,
	HWC_DISPLAY_NO_ATTRIBUTE,
	};

    const int NUM_DISPLAY_ATTRIBUTES = (sizeof(DISPLAY_ATTRIBUTES) / sizeof(DISPLAY_ATTRIBUTES)[0]);

    for (size_t i = 0; i < NUM_DISPLAY_ATTRIBUTES -1; ++i) {
	switch (attributes[i]) {
	case HWC_DISPLAY_VSYNC_PERIOD:
	    values[i] = ctx->vinfo.vsync_len;
	    break;
	case HWC_DISPLAY_WIDTH:
	    values[i] = ctx->vinfo.xres;
	    break;
	case HWC_DISPLAY_HEIGHT:
	    values[i] = ctx->vinfo.yres;
	    break;
	case HWC_DISPLAY_DPI_X:
	    values[i] = (int32_t) (ctx->xdpi * 1000);
	    break;
	case HWC_DISPLAY_DPI_Y:
	    values[i] = (int32_t) (ctx->ydpi * 1000);
	    break;
	default:
	    ALOGE("Unknown display attr: %d", attributes[i]);
	    return  -EINVAL;
	}
    }
    return 0;
}

static int
hwc_getActiveConfig(struct hwc_composer_device_1* dev, int disp)
{
    //Just 0 by now
    return 0;
}

static int
hwc_setActiveConfig(struct hwc_composer_device_1* dev, int disp, int index)
{
    return 0;
}
/* Will be uncommented at 1.4
static int
hwc_setPowerMode(struct hwc_composer_device_1* dev, int disp, int mode)
{
    ATRACE_CALL();
    hwc_context_t* ctx = to_ctx(dev);
    int ret = 0, value = 0;
    ALOGD("%s: Setting mode %d", __func__, mode);

    switch(mode) {
	case HWC_POWER_MODE_OFF:
	    value = FB_BLANK_POWERDOWN;
	    break;
	case HWC_POWER_MODE_DOZE:
	case HWC_POWER_MODE_DOZE_SUSPEND:
	    value = FB_BLANK_VSYNC_SUSPEND;
	    break;
	case HWC_POWER_MODE_NORMAL:
	    value = FB_BLANK_UNBLANK;
	    break;
    }

    if(ioctl(ctx->fb0, FBIOBLANK, value) < 0) {
	ALOGE("%s: ioctl FBIOBLANK failed: %s %d", __func__, strerror(errno), value);
	return -errno;
    }

 return ret;
}
*/

static void
hwc_registerProcs(struct hwc_composer_device_1* dev,
	hwc_procs_t const* procs)
{
    ALOGE("Registering procs");
    hwc_context_t* ctx = to_ctx(dev);
    ctx->proc = procs;
    hisi_vsync_start(ctx);//Start vsync thread.
}

static struct hw_module_methods_t hwc_module_methods = {
  .open = hwc_device_open
};

hwc_module_t HAL_MODULE_INFO_SYM = {
  .common = {
      .tag =     HARDWARE_MODULE_TAG,
      .version_major = 2,
      .version_minor = 0,
      .id = HWC_HARDWARE_MODULE_ID,
      .name =    "HiSilicon HwComposer module",
      .author =  "Eduardo Alonso <edu@error404software.com>",
      .methods = &hwc_module_methods,
      .dso =     0,
      .reserved = {0},
}
};

static int
hwc_device_open(const struct hw_module_t *module, const char *name, struct hw_device_t **device)
{
    hwc_context_t *ctx;
    int ret = 0;
    if (strcmp(name, HWC_HARDWARE_COMPOSER))
        return -EINVAL;
    ctx = (hwc_context_t *) calloc(1, sizeof(*ctx));

    //Setup the methods
    ctx->device.common.tag = HARDWARE_DEVICE_TAG;
    ctx->device.common.version = HWC_DEVICE_API_VERSION_1_0;
    ctx->device.common.module = (struct hw_module_t *) module;
    ctx->device.common.close = hwc_device_close;
    ctx->device.prepare = hwc_prepare;
    ctx->device.set = hwc_set;
    ctx->device.eventControl = hwc_eventControl;
    ctx->device.blank = hwc_blank;
    ctx->device.query = hwc_query;
    ctx->device.dump = hwc_dump;
    ctx->device.getDisplayConfigs = hwc_getDisplayConfigs;
    ctx->device.getDisplayAttributes = hwc_getDisplayAttributes;
    ctx->device.getActiveConfig     = hwc_getActiveConfig;
    ctx->device.setActiveConfig = hwc_setActiveConfig;
//    ctx->device.setPowerMode = hwc_setPowerMode;
    ctx->device.registerProcs = hwc_registerProcs;

    *device = &ctx->device.common;

    ALOGD("Loading HwComposer...");
    //FB Comms.
    ctx->fb0 = open("/dev/graphics/fb0", O_RDWR);
    if (ioctl(ctx->fb0, FBIOGET_VSCREENINFO, &ctx->vinfo) != 0) 
	ALOGE("Error reading FB info!");

    if (ioctl(ctx->fb0, FBIOGET_FSCREENINFO, &ctx->finfo) != 0)
	ALOGE("Error reading FB info!");

    return ret;
}

