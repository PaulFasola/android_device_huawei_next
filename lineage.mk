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
PRODUCT_NAME := lineage_next
PRODUCT_BRAND := huawei
PRODUCT_MODEL := Huawei Mate 8
PRODUCT_MANUFACTURER := HUAWEI
PRODUCT_RELEASE_NAME := Huawei Mate 8
