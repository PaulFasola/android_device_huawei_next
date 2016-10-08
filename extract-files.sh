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
echo "===> Extracting framework/com.huawei.audioalgo.jar\n"
adb pull /framework/com.huawei.audioalgo.jar ../../../proprietary/framework
echo "===> Extracting firmware/wifi_cfg\n"
adb pull /firmware/wifi_cfg ../../../proprietary/firmware
echo "===> Extracting firmware/cr4_regmem.bin\n"
adb pull /firmware/cr4_regmem.bin ../../../proprietary/firmware
echo "===> Extracting firmware/hifi_6402_2spk.img\n"
adb pull /firmware/hifi_6402_2spk.img ../../../proprietary/firmware
echo "===> Extracting firmware/isp_bw.elf\n"
adb pull /firmware/isp_bw.elf ../../../proprietary/firmware
echo "===> Extracting firmware/isp_fw.elf\n"
adb pull /firmware/isp_fw.elf ../../../proprietary/firmware
echo "===> Extracting firmware/nvram43455_hw_vn1.txt\n"
adb pull /firmware/nvram43455_hw_vn1.txt ../../../proprietary/firmware
echo "===> Extracting firmware/fw_bcm43455_apsta_hw.bin\n"
adb pull /firmware/fw_bcm43455_apsta_hw.bin ../../../proprietary/firmware
echo "===> Extracting firmware/cr4_asic.bin\n"
adb pull /firmware/cr4_asic.bin ../../../proprietary/firmware
echo "===> Extracting firmware/fw_bcm4334_test_2ant.bin\n"
adb pull /firmware/fw_bcm4334_test_2ant.bin ../../../proprietary/firmware
echo "===> Extracting firmware/CPU_RAM_SCHED.bin\n"
adb pull /firmware/CPU_RAM_SCHED.bin ../../../proprietary/firmware
echo "===> Extracting firmware/libpn548ad_fw.so\n"
adb pull /firmware/libpn548ad_fw.so ../../../proprietary/firmware
echo "===> Extracting firmware/fw_bcm43455_test_hw_apsta.bin\n"
adb pull /firmware/fw_bcm43455_test_hw_apsta.bin ../../../proprietary/firmware
echo "===> Extracting firmware/hifi_6402.img\n"
adb pull /firmware/hifi_6402.img ../../../proprietary/firmware
echo "===> Extracting firmware/nvram43455_hw.txt\n"
adb pull /firmware/nvram43455_hw.txt ../../../proprietary/firmware
echo "===> Extracting firmware/Total.wdk\n"
adb pull /firmware/Total.wdk ../../../proprietary/firmware
echo "===> Extracting firmware/isp_dts.img\n"
adb pull /firmware/isp_dts.img ../../../proprietary/firmware
echo "===> Extracting firmware/fw_bcm4334_hw_2ant.bin\n"
adb pull /firmware/fw_bcm4334_hw_2ant.bin ../../../proprietary/firmware
echo "===> Extracting firmware/bfgx_cfg\n"
adb pull /firmware/bfgx_cfg ../../../proprietary/firmware
echo "===> Extracting firmware/BCM4345C0_003.001.025.0103.0000.hcd\n"
adb pull /firmware/BCM4345C0_003.001.025.0103.0000.hcd ../../../proprietary/firmware
echo "===> Extracting firmware/nvram43455_hw_next_sar.txt\n"
adb pull /firmware/nvram43455_hw_next_sar.txt ../../../proprietary/firmware
echo "===> Extracting firmware/bfgx_and_wifi_cfg\n"
adb pull /firmware/bfgx_and_wifi_cfg ../../../proprietary/firmware
echo "===> Extracting firmware/ram_reg_test_cfg\n"
adb pull /firmware/ram_reg_test_cfg ../../../proprietary/firmware
echo "===> Extracting firmware/fw_bcm43455_hw.bin\n"
adb pull /firmware/fw_bcm43455_hw.bin ../../../proprietary/firmware
echo "===> Extracting firmware/CPU_RAM_WBS.bin\n"
adb pull /firmware/CPU_RAM_WBS.bin ../../../proprietary/firmware
echo "===> Extracting etc/audio_effects.conf\n"
adb pull /etc/audio_effects.conf ../../../proprietary/etc
echo "===> Extracting lib/drm/libdrmwvmplugin.so\n"
adb pull /lib/drm/libdrmwvmplugin.so ../../../proprietary/lib/drm
echo "===> Extracting lib/egl/libGLES_mali.so\n"
adb pull /lib/egl/libGLES_mali.so ../../../proprietary/lib/egl


# Total 28 files added on 2016-10-08T17:55:04.949412 UTC
