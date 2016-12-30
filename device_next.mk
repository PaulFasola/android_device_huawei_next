LOCAL_PATH := device/huawei/next

DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

$(call inherit-product, build/target/product/full_base_telephony.mk)
$(call inherit-product, build/target/product/languages_full.mk)
$(call inherit-product, vendor/huawei/next/BoardConfigVendor.mk)
$(call inherit-product, build/target/product/core_64_bit.mk)

ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/huawei/next/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

PRODUCT_PACKAGES += libshim_general \
                    libshim_log

# Screen density
PRODUCT_AAPT_CONFIG := normal xxhdpi
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Screen size
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080

# Device infos
PRODUCT_NAME := next
PRODUCT_DEVICE := next
PRODUCT_MANUFACTURER := HUAWEI
PRODUCT_MODEL := next

# Ramdisk
PRODUCT_COPY_FILES += \
        $(LOCAL_PATH)/rootdir/init.balong_modem.rc:root/init.balong_modem.rc \
	$(LOCAL_PATH)/rootdir/init.chip.usb.rc:root/init.chip.usb.rc \
	$(LOCAL_PATH)/rootdir/init.connectivity.rc:root/init.connectivity.rc \
	$(LOCAL_PATH)/rootdir/init.connectivity.bcm43455.rc:root/init.connectivity.bcm43455.rc \
	$(LOCAL_PATH)/rootdir/fstab.hi3650:root/fstab.hi3650 \
	$(LOCAL_PATH)/rootdir/init.41038.rc:root/init.41038.rc \
	$(LOCAL_PATH)/rootdir/init.hi3650.rc:root/init.hi3650.rc \
	$(LOCAL_PATH)/rootdir/init.audio.rc:root/init.audio.rc \
	$(LOCAL_PATH)/rootdir/init.zygote64_32.rc:root/init.zygote64_32.rc \
	$(LOCAL_PATH)/rootdir/init.protocol.rc:root/init.protocol.rc \
	$(LOCAL_PATH)/rootdir/init.post-fs-data.rc:root/init.post-fs-data.rc \
	$(LOCAL_PATH)/rootdir/init.extmodem.rc:root/init.extmodem.rc \
	$(LOCAL_PATH)/rootdir/init.performance.rc:root/init.performance.rc \
	$(LOCAL_PATH)/rootdir/init.hi3650.gps.rc:root/init.hi3650.gps.rc \
	$(LOCAL_PATH)/rootdir/init.hi3650.power.rc:root/init.hi3650.power.rc \
	$(LOCAL_PATH)/rootdir/init.hi3650.power.sh:root/init.hi3650.power.sh \
	$(LOCAL_PATH)/rootdir/init.hi3650.usb.rc:root/init.hi3650.usb.rc \
	$(LOCAL_PATH)/rootdir/init.tee.rc:root/init.tee.rc \
	$(LOCAL_PATH)/rootdir/ueventd.hi3650.rc:root/ueventd.hi3650.rc \
	$(LOCAL_PATH)/rootdir/init.connectivity.hisi.rc:root/init.connectivity.hisi.rc \
	$(LOCAL_PATH)/rootdir/init.manufacture.rc:root/init.manufacture.rc \
	$(LOCAL_PATH)/rootdir/init.rc:root/init.rc \
	$(LOCAL_PATH)/rootdir/init.device.rc:root/init.device.rc \
	$(LOCAL_PATH)/rootdir/init.zygote32.rc:root/init.zygote32.rc \
	$(LOCAL_PATH)/rootdir/init.platform.rc:root/init.platform.rc \
	$(LOCAL_PATH)/rootdir/init.connectivity.gps.rc:root/init.connectivity.gps.rc \
	$(LOCAL_PATH)/rootdir/init.hisi.rc:root/init.hisi.rc \
	$(LOCAL_PATH)/rootdir/sbin/logctl_service:root/sbin/logctl_service \
	$(LOCAL_PATH)/rootdir/sbin/check_root:root/sbin/check_root \
	$(LOCAL_PATH)/rootdir/sbin/hw_ueventd:root/sbin/hw_ueventd \
	$(LOCAL_PATH)/rootdir/sbin/ntfs-3gd:root/sbin/ntfs-3gd

# Bluetooth
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/bluetooth/auto_pair_devlist.conf:system/etc/bluetooth/auto_pair_devlist.conf \
	$(LOCAL_PATH)/bluetooth/bt_did.conf:system/etc/bluetooth/bt_did.conf \
	$(LOCAl_PATH)/bluetooth/bt_stack.conf:system/etc/bluetooth/bt_stack.conf \
	$(LOCAl_PATH)/bluetooth/bt_stack_beta.conf:system/etc/bluetooth/bt_stack_beta.conf \
	$(LOCAl_PATH)/bluetooth/bt_stack_log.conf:system/etc/bluetooth/bt_stack_log.conf

# Audio
PRODUCT_PACKAGES += \
    audio.primary.default \
    audio.a2dp.default \
    audio.usb.default \
    audio.r_submix.default \
    libaudioutils \
    libaudioroute \
    libtinyalsa \
    tinyplay \
    tinycap \
    tinymix \
    tinypcminfo

# Wifi
PRODUCT_PACKAGES += \
         hostapd

# Fingerprint
PRODUCT_PACKAGES += \
     fingerprintd

# Power HAL
PRODUCT_PACKAGES += \
    power.hi3650

PRODUCT_GMS_CLIENTID_BASE := android-huawei

PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.ril.config=simactivation

PRODUCT_BUILD_PROP_OVERRIDES += \
    BUILD_FINGERPRINT="HUAWEI/NXT-L29/HWNXT:6.0/HUAWEINXT-L29/C900B182:user/release-keys" \
    PRIVATE_BUILD_DESC="EVA-L29-user 6.0 HUAWEINXT-L29 C900B182 release-keys"
