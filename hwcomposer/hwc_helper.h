#ifndef HWC_H
#define HWC_H
#define HISIFB_IOCTL_MAGIC 'M'
#define HISIFB_VSYNC_CTRL _IOW(HISIFB_IOCTL_MAGIC, 0x02, unsigned int)

#define to_ctx(dev) ((hwc_context_t *)dev)

#undef LOG_TAG
#define LOG_TAG "HisiHwcomposer"

struct vState {
    pthread_mutex_t lock;
    pthread_cond_t cond;
    bool enabled;
};

struct hwc_context_t {
    hwc_composer_device_1_t device;
    const hwc_procs_t* proc;
    int fb0;
    struct fb_var_screeninfo vinfo;
    struct fb_fix_screeninfo finfo;
    struct vState vstate;
    float xdpi = ((float)(vinfo.xres) * 25.4f) / (float)(vinfo.width);
    float ydpi = ((float)(vinfo.yres) * 25.4f) / (float)(vinfo.height);
};

void hisi_vsync_start(hwc_context_t* ctx);

#endif //HWC_H
