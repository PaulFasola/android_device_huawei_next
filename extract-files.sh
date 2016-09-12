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
echo "===> Extracting system/framework/com.huawei.audioalgo.jar\n"
adb pull /system/framework/com.huawei.audioalgo.jar ../../../proprietary/system/framework
echo "===> Extracting system/lib/drm/libdrmwvmplugin.so\n"
adb pull /system/lib/drm/libdrmwvmplugin.so ../../../proprietary/system/lib/drm
echo "===> Extracting system/lib/egl/libGLES_mali.so\n"
adb pull /system/lib/egl/libGLES_mali.so ../../../proprietary/system/lib/egl
echo "===> Extracting system/firmware/hifi_6402_2spk.img\n"
adb pull /system/firmware/hifi_6402_2spk.img ../../../proprietary/system/firmware
echo "===> Extracting system/firmware/fw_bcm43455_test_hw_apsta.bin\n"
adb pull /system/firmware/fw_bcm43455_test_hw_apsta.bin ../../../proprietary/system/firmware
echo "===> Extracting system/firmware/isp_bw.elf\n"
adb pull /system/firmware/isp_bw.elf ../../../proprietary/system/firmware
echo "===> Extracting system/firmware/ram_reg_test_cfg\n"
adb pull /system/firmware/ram_reg_test_cfg ../../../proprietary/system/firmware
echo "===> Extracting system/firmware/CPU_RAM_SCHED.bin\n"
adb pull /system/firmware/CPU_RAM_SCHED.bin ../../../proprietary/system/firmware
echo "===> Extracting system/firmware/wifi_cfg\n"
adb pull /system/firmware/wifi_cfg ../../../proprietary/system/firmware
echo "===> Extracting system/firmware/CPU_RAM_WBS.bin\n"
adb pull /system/firmware/CPU_RAM_WBS.bin ../../../proprietary/system/firmware
echo "===> Extracting system/firmware/nvram43455_hw_vn1.txt\n"
adb pull /system/firmware/nvram43455_hw_vn1.txt ../../../proprietary/system/firmware
echo "===> Extracting system/firmware/nvram43455_hw.txt\n"
adb pull /system/firmware/nvram43455_hw.txt ../../../proprietary/system/firmware
echo "===> Extracting system/firmware/nvram43455_hw_next_sar.txt\n"
adb pull /system/firmware/nvram43455_hw_next_sar.txt ../../../proprietary/system/firmware
echo "===> Extracting system/firmware/bfgx_cfg\n"
adb pull /system/firmware/bfgx_cfg ../../../proprietary/system/firmware
echo "===> Extracting system/firmware/fw_bcm4334_hw_2ant.bin\n"
adb pull /system/firmware/fw_bcm4334_hw_2ant.bin ../../../proprietary/system/firmware
echo "===> Extracting system/firmware/Total.wdk\n"
adb pull /system/firmware/Total.wdk ../../../proprietary/system/firmware
echo "===> Extracting system/firmware/fw_bcm4334_test_2ant.bin\n"
adb pull /system/firmware/fw_bcm4334_test_2ant.bin ../../../proprietary/system/firmware
echo "===> Extracting system/firmware/bfgx_and_wifi_cfg\n"
adb pull /system/firmware/bfgx_and_wifi_cfg ../../../proprietary/system/firmware
echo "===> Extracting system/firmware/isp_dts.img\n"
adb pull /system/firmware/isp_dts.img ../../../proprietary/system/firmware
echo "===> Extracting system/firmware/cr4_regmem.bin\n"
adb pull /system/firmware/cr4_regmem.bin ../../../proprietary/system/firmware
echo "===> Extracting system/firmware/cr4_asic.bin\n"
adb pull /system/firmware/cr4_asic.bin ../../../proprietary/system/firmware
echo "===> Extracting system/firmware/BCM4345C0_003.001.025.0103.0000.hcd\n"
adb pull /system/firmware/BCM4345C0_003.001.025.0103.0000.hcd ../../../proprietary/system/firmware
echo "===> Extracting system/firmware/isp_fw.elf\n"
adb pull /system/firmware/isp_fw.elf ../../../proprietary/system/firmware
echo "===> Extracting system/firmware/hifi_6402.img\n"
adb pull /system/firmware/hifi_6402.img ../../../proprietary/system/firmware
echo "===> Extracting system/firmware/libpn548ad_fw.so\n"
adb pull /system/firmware/libpn548ad_fw.so ../../../proprietary/system/firmware
echo "===> Extracting system/firmware/fw_bcm43455_apsta_hw.bin\n"
adb pull /system/firmware/fw_bcm43455_apsta_hw.bin ../../../proprietary/system/firmware
echo "===> Extracting system/firmware/fw_bcm43455_hw.bin\n"
adb pull /system/firmware/fw_bcm43455_hw.bin ../../../proprietary/system/firmware
echo "===> Extracting system/etc/audio_effects.conf\n"
adb pull /system/etc/audio_effects.conf ../../../proprietary/system/etc


# Total 28 files added on 2016-09-10T17:52:23.354745 UTC
