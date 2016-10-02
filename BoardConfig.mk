USE_CAMERA_STUB := true
PRODUCT_PREBUILT_WEBVIEWCHROMIUM := yes

# CPU
# Bootloader
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true
TARGET_BOOTLOADER_BOARD_NAME := HWNXT

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a7

TARGET_CPU_SMP := true
TARGET_GLOBAL_CFLAGS += -mfpu=neon-vfpv4 -mtune=cortex-a15 -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon-vfpv4 -mtune=cortex-a15 -mfloat-abi=softfp
TARGET_EXTRA_CFLAGS := -mtune=cortex-a15 -mcpu=cortex-a15

BOARD_VENDOR := huawei
TARGET_BOARD_PLATFORM := hi3650
TARGET_SOC := kirin950

TARGET_USES_64_BIT_BINDER := true
TARGET_SUPPORTS_32_BIT_APPS := true
TARGET_SUPPORTS_64_BIT_APPS := true
TARGET_USERIMAGES_USE_F2FS := true

ARCH_ARM_HAVE_TLS_REGISTER := true

BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_SUPPRESS_SECURE_ERASE := true
BOARD_HAS_NO_SELECT_BUTTON := true

# Kernel
#TARGET_KERNEL_CONFIG := merge_hi3650_defconfig
TARGET_PREBUILT_KERNEL := device/huawei/next/kernel
BOARD_KERNEL_CMDLINE  := 'mmcparts=mmcblk0:p1(vrl),p2(vrl_backup),p6(modemnvm_factory),p9(splash),p10(modemnvm_backup),p11(modemnvm_img),p12(modemnvm_system),p14(3rdmodemnvm),p15(3rdmodemnvmbkp),p18(modem_om),p21(modemnvm_update),p31(modem),p32(modem_dsp),p35(3rdmodem) loglevel=4 androidboot.selinux=permissive'
BOARD_KERNEL_BASE     := 0x00478000
BOARD_MKBOOTIMG_ARGS := --kernel_offset 0x00008000 --ramdisk_offset 0x07b88000 --tags_offset 0x07588000
BOARD_KERNEL_PAGESIZE := 2048

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 33554432
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2684354560
BOARD_USERDATAIMAGE_PARTITION_SIZE := 26935820288
BOARD_FLASH_BLOCK_SIZE := 131072
TARGET_USERIMAGES_USE_EXT4 := true

# USB mass storage
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/class/android_usb/android0/f_mass_storage/lun/file"

# Display
TARGET_BOOTANIMATION_PRELOAD := true
TARGET_BOOTANIMATION_TEXTURE_CACHE := true
TARGET_USE_PAN_DISPLAY := true
BRIGHTNESS_SYS_FILE := "/sys/devices/platform/hisi_fb.1048577/leds/lcd_backlight0/brightness"

# ADB
ADDITIONAL_DEFAULT_PROPERTIES += ro.adb.secure=0
ADDITIONAL_DEFAULT_PROPERTIES += persist.service.adb.enable=1  
ADDITIONAL_DEFAULT_PROPERTIES += persist.service.debuggable=1
ADDITIONAL_DEFAULT_PROPERTIES += persist.sys.usb.config=mtp,adb 

# Recovery 
RECOVERY_FSTAB_VERSION := 2
TARGET_RECOVERY_FSTAB := device/huawei/next/hi3650.fstab

# SELinux
BOARD_SEPOLICY_DIRS += \
    device/huawei/next/sepolicy

# Paths
TW_EXTERNAL_STORAGE_PATH := "/external_sd"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sd"

# inherit from the proprietary version
-include vendor/huawei/next/BoardConfigVendor.mk

$(shell mkdir -p $(OUT)/obj/KERNEL_OBJ/usr)
