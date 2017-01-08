#
# Copyright (C) 2016 The LinearOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

LOCAL_PATH := device/huawei/next

DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

$(call inherit-product, build/target/product/full_base_telephony.mk)
$(call inherit-product, build/target/product/languages_full.mk)
$(call inherit-product, vendor/huawei/next/BoardConfigVendor.mk)
$(call inherit-product, build/target/product/core_64_bit.mk)
$(call inherit-product, device/common/gps/gps_us_supl.mk)

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
	$(LOCAL_PATH)/rootdir/init.post-fs-data.rc:root/init.post-fs-data.rc \
	$(LOCAL_PATH)/rootdir/init.extmodem.rc:root/init.extmodem.rc \
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

PRODUCT_PACKAGES += \
flp.default

# Wifi
PRODUCT_PACKAGES += \
     hostapd

# Fingerprint
PRODUCT_PACKAGES += \
     fingerprintd

# Power HAL
PRODUCT_PACKAGES += \
     power.hi3650

# Camera
PRODUCT_PACKAGES += \
    camera.default

# NFC
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/com.nxp.mifare.xml:system/etc/permissions/com.nxp.mifare.xml \
	frameworks/native/data/etc/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml \
	frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
	frameworks/native/data/etc/android.hardware.nfc.hce.xml:system/etc/permissions/android.hardware.nfc.hce.xml \

# Apps
PRODUCT_PACKAGES += \
    OpenGapps \
    SuperSu

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/permissions/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
	$(LOCAL_PATH)/permissions/android.hardware.camera.external.xml:system/etc/permissions/android.hardware.camera.external.xml \
	$(LOCAL_PATH)/permissions/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
	$(LOCAL_PATH)/permissions/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
	$(LOCAL_PATH)/permissions/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
	$(LOCAL_PATH)/permissions/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
	$(LOCAL_PATH)/permissions/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
	$(LOCAL_PATH)/permissions/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
	$(LOCAL_PATH)/permissions/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
	$(LOCAL_PATH)/permissions/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
	$(LOCAL_PATH)/permissions/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
	$(LOCAL_PATH)/permissions/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
	$(LOCAL_PATH)/permissions/android.hardware.sensor.stepcounter.xml:system/etc/permissions/android.hardware.sensor.stepcounter.xml \
	$(LOCAL_PATH)/permissions/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
	$(LOCAL_PATH)/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
	$(LOCAL_PATH)/permissions/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
	$(LOCAL_PATH)/permissions/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
	$(LOCAL_PATH)/permissions/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
	$(LOCAL_PATH)/permissions/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
	$(LOCAL_PATH)/permissions/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	$(LOCAL_PATH)/permissions/android.software.app_widgets.xml:system/etc/permissions/android.software.app_widgets.xml \
	$(LOCAL_PATH)/permissions/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml \
	$(LOCAL_PATH)/permissions/android.software.webview.xml:system/etc/permissions/android.software.webview.xml \
	$(LOCAL_PATH)/permissions/com.android.location.provider.xml:system/etc/permissions/com.android.location.provider.xml \
	$(LOCAL_PATH)/permissions/com.android.media.remotedisplay.xml:system/etc/permissions/com.android.media.remotedisplay.xml \
	$(LOCAL_PATH)/permissions/com.android.mediadrm.signer.xml:system/etc/permissions/com.android.mediadrm.signer.xml \
	$(LOCAL_PATH)/permissions/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
	$(LOCAL_PATH)/permissions/platform.xml:system/etc/permissions/platform.xml

PRODUCT_GMS_CLIENTID_BASE := android-huawei

PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.ril.config=simactivation
