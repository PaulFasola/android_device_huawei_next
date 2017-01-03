# Release name
PRODUCT_RELEASE_NAME := next

# Inherit some common LaOS stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/huawei/next/device_next.mk)


# .PROP OVERRIDE

ADDITIONAL_DEFAULT_PROPERTIES += \
	ro.allow.mock.location=1 \
	persist.logd.logpersistd=logcatd \
        ro.hardware=hi3650 \
        persist.sys.isUsbOtgEnabled=true

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := next
PRODUCT_NAME := cm_next
PRODUCT_BRAND := huawei
PRODUCT_MODEL := next
PRODUCT_MANUFACTURER := HUAWEI

