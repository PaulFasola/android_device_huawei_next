$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)
$(call inherit-product-if-exists, vendor/huawei/next/next-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/huawei/next/overlay


ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/huawei/next/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := next
PRODUCT_DEVICE := next
PRODUCT_MANUFACTURER := HUAWEI
PRODUCT_MODEL := next

# Screen density
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xhdpi

# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080


# ========================================== .PROP OVVERRIDES ==========================================

PRODUCT_BUILD_PROP_OVERRIDES += \

	BUILD_UTC_DATE=0 \

	

## From stock system.prop

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \

	ro.adb.secure=0 \

	ro.secure=0 \

	ro.allow.mock.location=1 \

	ro.debuggable=1 \

	persist.sys.usb.config=mtp,adb \

	persist.logd.logpersistd=logcatd \

	debug.graphic_log=1



# Debug options

PRODUCT_PROPERTY_OVERRIDES += \

	ro.adb.secure=0 \

	ro.secure=0 \

	ro.allow.mock.location=1 \

	ro.debuggable=1 \

	persist.sys.usb.config=mtp,adb \

	persist.logd.logpersistd=logcatd \

	debug.graphic_log=1

	

ADDITIONAL_DEFAULT_PROPERTIES += \

	ro.adb.secure=0 \

	ro.secure=0 \

	ro.allow.mock.location=1 \

	ro.debuggable=1 \

	persist.sys.usb.config=mtp,adb \

	persist.logd.logpersistd=logcatd \

	debug.graphic_log=1


# ========================================== RAMDISK ==========================================

include device/huawei/next/init.mk
