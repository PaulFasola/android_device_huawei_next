# Release name
PRODUCT_RELEASE_NAME := next

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/huawei/next/device_next.mk)

# Screen density
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xhdpi

# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080

# .PROP OVERRIDE

ADDITIONAL_DEFAULT_PROPERTIES += \
	ro.adb.secure=0 \
	ro.secure=0 \
	ro.allow.mock.location=1 \
	ro.debuggable=1 \
	persist.sys.usb.config=mtp,adb \
	persist.logd.logpersistd=logcatd \
	debug.graphic_log=1 \
        ro.hardware=hi3650

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := next
PRODUCT_NAME := cm_next
PRODUCT_BRAND := huawei
PRODUCT_MODEL := next
PRODUCT_MANUFACTURER := HUAWEI


