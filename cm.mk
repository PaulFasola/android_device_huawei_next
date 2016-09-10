# Release name
PRODUCT_RELEASE_NAME := next

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/huawei/next/device_next.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := next
PRODUCT_NAME := cm_next
PRODUCT_BRAND := huawei
PRODUCT_MODEL := next
PRODUCT_MANUFACTURER := huawei
