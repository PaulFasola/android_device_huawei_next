$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/huawei/next/next-vendor.mk)

$(call inherit-product, build/target/product/full.mk)


DEVICE_PACKAGE_OVERLAYS += device/huawei/next/overlay

ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/huawei/next-kernel/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

# Screen density
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xhdpi

# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080

# Device infos
PRODUCT_NAME := next
PRODUCT_DEVICE := next
PRODUCT_MANUFACTURER := HUAWEI
PRODUCT_MODEL := next

# Enable ADB during boot for debugging. (Very unsafe. Remove before public build)
ADDITIONAL_DEFAULT_PROPERTIES += \
	ro.adb.secure=0 \
	ro.secure=0 \
	ro.debuggable=1 \
   	ro.zygote=zygote64_32
        ro.hardware=hi3650

LOCAL_PATH := device/huawei/next

PRODUCT_PACKAGES += \
	init.balong_modem.rc \
	init.61276.rc \
	ueventd.61259.rc \
	init.environ.rc \
	init.chip.usb.rc \
	ueventd.62010.rc \
	ueventd.3741.rc \
	init.3583.rc \
	init.recovery.hisi.rc \
	init.connectivity.rc \
	init.connectivity.bcm43455.rc \
	fstab.hi3650 \
	ueventd.3583.rc \
	init.hi3650.rc \
	init.connectivity.bcm43xx.rc \
	init.3584.rc \
	ueventd.3584.rc \
	init.audio.rc \
	init.zygote64_32.rc \
	init.41038.rc \
	init.62010.rc \
	init.protocol.rc \
	init.post-fs-data.rc \
	init.extmodem.rc \
	init.61297.rc \
	init.performance.rc \
	init.71315.rc \
	init.tee.rc \
	ueventd.hi3650.rc \
	init.connectivity.hisi.rc \
	init.61262.rc \
	init.3741.rc \
	service_contexts \
	init.manufacture.rc \
	ueventd.71315.rc \
	init.device.rc \
	init.zygote32.rc \
	init.platform.rc \
	init.connectivity.gps.rc \
	ueventd.61262.rc \
	init.hisi.rc \
	ueventd.61297.rc \
	init.trace.rc \
	init.61259.rc \
	ueventd.61276.rc \
	ueventd.41038.rc \
	init.recovery.huawei.rc \
	init.usb.rc

