/*
   Copyright (c) 2013, The Linux Foundation. All rights reserved.

   Redistribution and use in source and binary forms, with or without
   modification, are permitted provided that the following conditions are
   met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above
      copyright notice, this list of conditions and the following
      disclaimer in the documentation and/or other materials provided
      with the distribution.
    * Neither the name of The Linux Foundation nor the names of its
      contributors may be used to endorse or promote products derived
      from this software without specific prior written permission.

   THIS SOFTWARE IS PROVIDED "AS IS" AND ANY EXPRESS OR IMPLIED
   WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
   MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT
   ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS
   BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
   CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
   SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
   BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
   WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
   OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN
   IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#include <stdlib.h>
#include <stdio.h>

#include "vendor_init.h"
#include "property_service.h"
#include "log.h"
#include "util.h"

#define ISMATCH(a,b)    (!strncmp(a,b,PROP_VALUE_MAX))

void apply_multi_sim_stategy(bool dualsim);

void vendor_load_properties()
{
    char platform[PROP_VALUE_MAX];
    char serialno[PROP_VALUE_MAX];
    char device[PROP_VALUE_MAX];
    char devicename[PROP_VALUE_MAX];
    char variant[PROP_VALUE_MAX];
    int rc;

    rc = property_get("ro.board.platform", platform);

    if (!rc || !ISMATCH(platform, ANDROID_TARGET)){
       INFO("PaulDebug => Device platform missmatch : %s != %s - Aborting\n", platform, ANDROID_TARGET);
       return;
    }

    property_get("ro.boot.serialno", serialno);

    memcpy(variant, serialno, 5 * sizeof( char ) );

    INFO("PaulDebug => SerialNo : %s", serialno);

    if (ISMATCH(variant, "AXS02")) {
        /* AXS02 aka L-09 */

	property_set("ro.bootimage.fingerprint", "HUAWEI/NXT-AL10/HWNXT:6.0/HUAWEINXT-AL10/C00B386:user/release-keys");
        property_set("ro.build.description", "NXT-AL10-user 6.0 HUAWEINXT-AL10 C00B386 release-keys");
        property_set("ro.build.fingerprint", "Huawei/NEXT/hi3650:6.0/MRA58K/jenkins10250512:user/test-keys");

        property_set("ro.product.name", "HUAWEI NXT-L09");
        property_set("ro.product.board", "NXT-L09");
        property_set("ro.product.model", "HUAWEI NEXT-L09");
	property_set("ro.build.id", "HUAWEINXT-L09");

        property_set("ro.product.variant", "L-09");

	// RIL - 0X3C012400 Modem
	property_set("rild.libpath", "/system/lib64/libbalong-ril.so");
	property_set("persist.dsds.enabled", "false");
	property_set("ro.telephony.default_network", "9");
	property_set("ro.multi.rild", "false");
	property_set("rild.libargs", "-m modem0");
	property_set("rild.rild1_ready_to_start", "false");
	property_set("ro.config.hw_dsda", "false");
	property_set("ro.config.reduce_sar_type1", "001");
	property_set("ro.config.dsds_mode","umts");
	property_set("persist.radio.modem.cap", "899BD");
        property_set("ro.config.hw_simlock_retries", "true");
	property_set("sys.oem_unlock_allowed", "1");

	apply_multi_sim_stategy(false);

   } else if (ISMATCH(variant, "CJL7N")) {
        /* CJL7N aka AL-10 */

	property_set("ro.bootimage.fingerprint", "HUAWEI/NXT-AL10/HWNXT:6.0/HUAWEINXT-AL10/C00B386:user/release-keys");
	property_set("ro.build.description", "NXT-AL10-user 6.0 HUAWEINXT-AL10 C00B386 release-keys");
        property_set("ro.build.fingerprint", "Huawei/NEXT/hi3650:6.0/MRA58K/jenkins10250512:user/test-keys");

	property_set("ro.product.name", "NXT-AL10");
	property_set("ro.product.model", "HUAWEI NXT-AL10");
	property_set("ro.build.id", "HUAWEINXT-AL10");

        property_set("ro.product.variant", "AL-10");

        // RIL - 3c003000 Modem
        property_set("ro.telephony.default_network", "8");
        property_set("ro.multi.rild", "false");
        property_set("rild.libpath1", "/system/lib64/libbalong-ril.so");
        property_set("persist.dsds.enabled", "true");
        property_set("rild.libargs1", "-m modem0");
        property_set("ro.config.full_network_support", "true");
        property_set("rild.libpath", "rild.libpath=/system/lib64/libbalong-ril.so");
        property_set("rild.libargs2", "-m modem2");
        property_set("persist.radio.multisim.config", "dsda");
        property_set("ro.config.is_start_commril", "true");
        property_set("rild.libpath2", "/system/lib64/libbalong-ril-1.so");
        property_set("rild.libpath3", "/system/lib64/libbalong-ril-2.so");
        property_set("rild.libpath", "/system/lib64/libvia-ril.so");
        property_set("rild.libargs2", "-m modem1");
	property_set("rild.libargs3", "-m modem2");
        property_set("persist.radio.modem.cap", "899BD");
        property_set("ro.config.dsds_mode", "cdma_gsm");
        property_set("ro.config.hw_dsda", "true");
        property_set("ro.config.modem_number", "4");
        property_set("ro.config.default_commril_mode", "CLG_MODE");
        property_set("ro.config.hw_device", "");
        property_set("ro.config.hw_device_mode", "clg_mode");
	property_set("ro.config.hw_save_pin", "true");
        property_set("ro.config.client_number", "3");
        property_set("rild.rild1_ready_to_start", "false");
        property_set("rild.libargs", "-d /dev/viacomm_cmux");
        property_set("hw_vtlte_on", "true");

	apply_multi_sim_stategy(true);
} else if(ISMATCH(variant, "QHC02")) {
        /* QHC02 aka L-29 */

        property_set("ro.build.description", "thea_retbr_ds-user 6.0 MPB24.65-34 31 release-keys");
        property_set("ro.build.fingerprint", "huawei/lineage_next/unknown:6.0.1/MOB31T/d93b0c0456:userdebug/test-keys");
        property_set("ro.build.product", "thea_umtsds");

	property_set("ro.product.name", "NXT-L29");
	property_set("ro.product.model", "HUAWEI NXT-L29");
	property_set("ro.build.id", "HUAWEINXT-L29");

	// RIL - 3C002C00 Modem
        property_set("ro.telephony.default_network", "9,1");
	property_set("ro.multi.rild", "false");
	property_set("rild.libpath1", "/system/lib64/libbalong-ril-1.so");
	property_set("persist.dsds.enabled", "true");
	property_set("rild.libargs1", "-m modem1");
	property_set("ro.config.full_network_support", "false");
	property_set("rild.libpath", "/system/lib64/libbalong-ril.so");
	property_set("rild.libargs2", "-m modem2");
        property_set("persist.radio.multisim.config", "dsda");
        property_set("ro.config.is_start_commril", "true");
        property_set("rild.libpath2", "/system/lib64/libbalong-ril-2.so");
        property_set("rild.libpath", "/system/lib64/libbalong-ril.so");
        property_set("rild.libargs2", "-m modem2");

	property_set("persist.radio.modem.cap", "899BD");
        property_set("ro.config.dsds_mode", "umts_gsm");
        property_set("ro.config.hw_dsda", "true");
	property_set("ro.config.modem_number", "3");
        property_set("ro.config.default_commril_mode", "ULG_MODE");
        property_set("ro.config.hw_device", "");
	property_set("ro.config.client_number", "3");
        property_set("rild.rild1_ready_to_start", "false");
        property_set("rild.libargs", "-m modem0");
	property_set("ro.product.variant", "L-29");
	property_set("net.tethering.noprovisioning", "true");
	property_set("gsm.fastdormancy.mode", "0");
	property_set("ro.cofig.onlinemusic.enabled", "false");
	property_set("ro.cofig.onlinevideo.enabled", "false");
	property_set("ro.config.hw_floatvideo", "false");
	property_set("ro.config.hw_ReduceSAR", "true");
	property_set("ro.config.hw_nfc_on", "true");
	property_set("ro.config.hw_nfc_msimce", "false");
	property_set("ro.config.hw_hotswap_on", "true");
	property_set("ro.config.hw_showTestInfo", "false");
	property_set("ro.config.hw_lte_support", "true");
	property_set("ro.config.soundtrigger_enabled", "0");
	property_set("ro.frp.pst", "/dev/block/platform/hi_mci.0/by-name/frp");
	property_set("ro.config.linkplus.roaming", "false  ");
	property_set("ro.com.google.clientidbase.am", "android-huawei");
	property_set("ro.com.google.clientidbase.gmm", "android-huawei");
	property_set("ro.com.google.clientidbase.ms", "android-huawei");
	property_set("ro.com.google.clientidbase.yt", "android-huawei");
	property_set("ro.config.spare_ntp_server", "ntp.sjtu.edu.cn,time.windows.com,time.nist.gov,1.cn.pool.ntp.org");
	property_set("ro.product.hardwareversion", "HL1NEXTM");
	property_set("ro.config.show_sim_icon", "true");
	property_set("ro.config.hw_channel_info", "0,0,0,0");
	property_set("ro.config.enable_rms", "false");
	property_set("ro.config.cbs_del_2B", "true");

	apply_multi_sim_stategy(true);
   } else {
       INFO("PaulDebug => Error : variant %s is unsupported.\n", variant);
       property_set("ro.product.variant", variant);
   }

    property_get("ro.product.device", device);
    strlcpy(devicename, device, sizeof(devicename));
    INFO("Found serialno %s setting build properties for %s device\n", serialno, devicename);
}


void apply_multi_sim_stategy(bool dualsim){
	if(dualsim){
	   property_set("persist.sys.dualcards", "true");
           property_set("ro.dual.sim.phone", "true");
	   property_set("persist.radio.multisim.config", "dsda");
	}
	else{
	   property_set("persist.sys.dualcards", "true");
           property_set("ro.dual.sim.phone", "true");
	   property_set("persist.radio.multisim.config", "single");
	}
}
