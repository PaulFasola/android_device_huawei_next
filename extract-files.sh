#!/bin/sh
##
# Automatically generated file by generate_files.py
# Script by gabry3795 - gabry.gabry <at> hotmail.it
# 
# These blobs are extracted from the proprietary version number B320
#################

echo "!!This script must be executed in the folder device/huawei/next!!\n\n"
echo "==> Creating the vendor folder..."
mkdir -p ../../../vendor/huawei/next/proprietary
echo "==> Copying BoardConfigVendor.."
cp BoardConfigVendor.mk.disabled ../../../vendor/huawei/next/proprietary/BoardConfigVendor.mk

echo "==> Starting extracting files, device must be connected and rooted!"
echo "===> Extracting system/vendor/framework/com.huawei.audioalgo.jar\n"
adb pull /system/vendor/framework/com.huawei.audioalgo.jar ../../../proprietary/system/vendor/framework
echo "===> Extracting system/vendor/firmware/wifi_cfg\n"
adb pull /system/vendor/firmware/wifi_cfg ../../../proprietary/system/vendor/firmware
echo "===> Extracting system/vendor/firmware/cr4_regmem.bin\n"
adb pull /system/vendor/firmware/cr4_regmem.bin ../../../proprietary/system/vendor/firmware
echo "===> Extracting system/vendor/firmware/hifi_6402_2spk.img\n"
adb pull /system/vendor/firmware/hifi_6402_2spk.img ../../../proprietary/system/vendor/firmware
echo "===> Extracting system/vendor/firmware/isp_bw.elf\n"
adb pull /system/vendor/firmware/isp_bw.elf ../../../proprietary/system/vendor/firmware
echo "===> Extracting system/vendor/firmware/isp_fw.elf\n"
adb pull /system/vendor/firmware/isp_fw.elf ../../../proprietary/system/vendor/firmware
echo "===> Extracting system/vendor/firmware/nvram43455_hw_vn1.txt\n"
adb pull /system/vendor/firmware/nvram43455_hw_vn1.txt ../../../proprietary/system/vendor/firmware
echo "===> Extracting system/vendor/firmware/fw_bcm43455_apsta_hw.bin\n"
adb pull /system/vendor/firmware/fw_bcm43455_apsta_hw.bin ../../../proprietary/system/vendor/firmware
echo "===> Extracting system/vendor/firmware/cr4_asic.bin\n"
adb pull /system/vendor/firmware/cr4_asic.bin ../../../proprietary/system/vendor/firmware
echo "===> Extracting system/vendor/firmware/fw_bcm4334_test_2ant.bin\n"
adb pull /system/vendor/firmware/fw_bcm4334_test_2ant.bin ../../../proprietary/system/vendor/firmware
echo "===> Extracting system/vendor/firmware/CPU_RAM_SCHED.bin\n"
adb pull /system/vendor/firmware/CPU_RAM_SCHED.bin ../../../proprietary/system/vendor/firmware
echo "===> Extracting system/vendor/firmware/libpn548ad_fw.so\n"
adb pull /system/vendor/firmware/libpn548ad_fw.so ../../../proprietary/system/vendor/firmware
echo "===> Extracting system/vendor/firmware/fw_bcm43455_test_hw_apsta.bin\n"
adb pull /system/vendor/firmware/fw_bcm43455_test_hw_apsta.bin ../../../proprietary/system/vendor/firmware
echo "===> Extracting system/vendor/firmware/hifi_6402.img\n"
adb pull /system/vendor/firmware/hifi_6402.img ../../../proprietary/system/vendor/firmware
echo "===> Extracting system/vendor/firmware/nvram43455_hw.txt\n"
adb pull /system/vendor/firmware/nvram43455_hw.txt ../../../proprietary/system/vendor/firmware
echo "===> Extracting system/vendor/firmware/Total.wdk\n"
adb pull /system/vendor/firmware/Total.wdk ../../../proprietary/system/vendor/firmware
echo "===> Extracting system/vendor/firmware/isp_dts.img\n"
adb pull /system/vendor/firmware/isp_dts.img ../../../proprietary/system/vendor/firmware
echo "===> Extracting system/vendor/firmware/fw_bcm4334_hw_2ant.bin\n"
adb pull /system/vendor/firmware/fw_bcm4334_hw_2ant.bin ../../../proprietary/system/vendor/firmware
echo "===> Extracting system/vendor/firmware/bfgx_cfg\n"
adb pull /system/vendor/firmware/bfgx_cfg ../../../proprietary/system/vendor/firmware
echo "===> Extracting system/vendor/firmware/BCM4345C0_003.001.025.0103.0000.hcd\n"
adb pull /system/vendor/firmware/BCM4345C0_003.001.025.0103.0000.hcd ../../../proprietary/system/vendor/firmware
echo "===> Extracting system/vendor/firmware/nvram43455_hw_next_sar.txt\n"
adb pull /system/vendor/firmware/nvram43455_hw_next_sar.txt ../../../proprietary/system/vendor/firmware
echo "===> Extracting system/vendor/firmware/bfgx_and_wifi_cfg\n"
adb pull /system/vendor/firmware/bfgx_and_wifi_cfg ../../../proprietary/system/vendor/firmware
echo "===> Extracting system/vendor/firmware/ram_reg_test_cfg\n"
adb pull /system/vendor/firmware/ram_reg_test_cfg ../../../proprietary/system/vendor/firmware
echo "===> Extracting system/vendor/firmware/fw_bcm43455_hw.bin\n"
adb pull /system/vendor/firmware/fw_bcm43455_hw.bin ../../../proprietary/system/vendor/firmware
echo "===> Extracting system/vendor/firmware/CPU_RAM_WBS.bin\n"
adb pull /system/vendor/firmware/CPU_RAM_WBS.bin ../../../proprietary/system/vendor/firmware
echo "===> Extracting system/vendor/etc/audio_effects.conf\n"
adb pull /system/vendor/etc/audio_effects.conf ../../../proprietary/system/vendor/etc
echo "===> Extracting system/vendor/lib/drm/libdrmwvmplugin.so\n"
adb pull /system/vendor/lib/drm/libdrmwvmplugin.so ../../../proprietary/system/vendor/lib/drm
echo "===> Extracting system/vendor/lib/egl/libGLES_mali.so\n"
adb pull /system/vendor/lib/egl/libGLES_mali.so ../../../proprietary/system/vendor/lib/egl


# Total 28 files added on 2016-10-17T21:27:50.690329 UTC
