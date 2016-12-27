#include <gralloc.h>
#include <gralloc_priv.h>
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
#include <utils/Log.h>
#include <hardware/hwcomposer.h>
#include <EGL/egl.h>
#include <ion/ion.h>
#include "hwc_helper.h"

static inline void
*hisi_vsync(void *dev)
{
    hwc_context_t *ctx = to_ctx(dev);
    char thread_name[] = "VsyncThread";
    uint64_t cur_timestamp = 0;
    uint64_t last_timestamp = 0;
    const int MAX_DATA = 64;
    static char vdata[MAX_DATA];
    memset(&vdata, '\0', sizeof(vdata));

    prctl(PR_SET_NAME, (unsigned long) &thread_name, 0, 0, 0);
    setpriority(PRIO_PROCESS, 0, HAL_PRIORITY_URGENT_DISPLAY +
                android::PRIORITY_MORE_FAVORABLE);
    int fd = open("sys/class/graphics/fb0/vsync_timestamp", O_RDONLY);
    ALOGE("Just read vsync_event");
    if (fd < 0) 
        ALOGE("Error opening Vsync timestamp file!");

    do {	
        ssize_t len = pread(fd, vdata, MAX_DATA -1, 0);
        if (len < 0)
            ALOGE("Error reading vsync timestamp!");

            cur_timestamp = strtoull(vdata, NULL, 0);
	    if (cur_timestamp != last_timestamp)
	    {
		uint64_t fake_timestamp = systemTime();
		ctx->proc->vsync(ctx->proc, HWC_DISPLAY_PRIMARY, cur_timestamp);
		last_timestamp = cur_timestamp;//Avoid sending duplicated timestamps
	    }

    } while (true);
    if(fd >= 0)
        close (fd);
}



void
hisi_vsync_start(hwc_context_t* ctx)
{
    int ret;
    pthread_t vsync_t;
   ret = pthread_create(&vsync_t, NULL, hisi_vsync, (void*) ctx);
    if (ret)
        ALOGE("Failed to create VSYNC's pthread!");
}

