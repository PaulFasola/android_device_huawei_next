/*
 * Copyright (C) 2016 The CyanogenMod Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#define LOG_TAG "HI3650 PowerHAL"

#define STATE_ON "state=1"

#define KERNEL_HMP_PATH "/sys/kernel/hmp/"
#define GPUFREQ_PATH "/sys/class/devfreq/gpufreq/"

#define CPUFREQ_PATH0 "/sys/devices/system/cpu/cpu0/cpufreq/"
#define CPUFREQ_PATH1 "/sys/devices/system/cpu/cpu4/cpufreq/"

#define INTERACTIVE_PATH0 "/sys/devices/system/cpu/cpu0/cpufreq/interactive/"
#define INTERACTIVE_PATH1 "/sys/devices/system/cpu/cpu4/cpufreq/interactive/"

#define TAP_TO_WAKE_NODE "/sys/touchscreen/easy_wakeup_gesture"
#define TAP_TO_WAKE_UP "/sys/touchscreen/wakeup_gesture_enable"

#define VID_ENC_TIMER_RATE 30000
#define VID_ENC_IO_IS_BUSY 0

enum {
    PROFILE_POWER_SAVE = 0,
    PROFILE_BALANCED,
    PROFILE_HIGH_PERFORMANCE,
    PROFILE_MAX
};

typedef struct governor_settings {
    char *above_hispeed_delay;
    int boost;
    int boostpulse_duration;
    int boostpulse_min_interval;
    int go_hispeed_load;
    int go_hispeed_load_off;
    int hispeed_freq;
    int hispeed_freq_off;
    int io_is_busy;
    int min_sample_time;
    char *target_loads;
    char *target_loads_off;
    int timer_rate;
    int timer_rate_off;
    int timer_slack;
    // freq.
    unsigned long scaling_max_freq;
    unsigned long scaling_min_freq;
    // hmp
    int down_threshold;
    int up_threshold;
    int task_fork_on_bigcluster;
    // gpu
    unsigned long max_freq;
    unsigned long min_freq;
    int polling_interval;
} power_profile;

static power_profile profiles0[PROFILE_MAX] = {
    [PROFILE_POWER_SAVE] = {
        .above_hispeed_delay = "20000",
        .boost = 0,
        .boostpulse_duration = 80000,
        .boostpulse_min_interval = 500000,
        .go_hispeed_load = 99,
        .go_hispeed_load_off = 110,
        .hispeed_freq = 1306000,
        .hispeed_freq_off = 1306000,
        .io_is_busy = 0,
        .min_sample_time = 80000,
        .target_loads = "70 807000:80 1018000:90 1306000:95",
        .target_loads_off = "95 1306000:99",
        .timer_rate = 20000,
        .timer_rate_off = 50000,
        .timer_slack = 80000,
        .scaling_max_freq = 1805000,
        .scaling_min_freq = 480000,
	.down_threshold = 512,
	.up_threshold = 1024,
	.task_fork_on_bigcluster = 0,
	.max_freq = 900000000,
	.min_freq = 360000000,
	.polling_interval = 20,
    },
    [PROFILE_BALANCED] = {
        .above_hispeed_delay = "20000",
        .boost = 0,
        .boostpulse_duration = 80000,
        .boostpulse_min_interval = 500000,
        .go_hispeed_load = 95,
        .go_hispeed_load_off = 110,
        .hispeed_freq = 1306000,
        .hispeed_freq_off = 1306000,
        .io_is_busy = 1,
        .min_sample_time = 80000,
        .target_loads = "70 807000:80 1018000:90 1306000:95",
        .target_loads_off = "95 1306000:99",
        .timer_rate = 20000,
        .timer_rate_off = 50000,
        .timer_slack = 80000,
        .scaling_max_freq = 1805000,
        .scaling_min_freq = 480000,
	.down_threshold = 384,
	.up_threshold = 700,
	.task_fork_on_bigcluster = 1,
	.max_freq = 900000000,
	.min_freq = 360000000,
	.polling_interval = 40,
    },
    [PROFILE_HIGH_PERFORMANCE] = {
        .above_hispeed_delay = "20000",
        .boost = 1,
        .boostpulse_duration = 80000,
        .boostpulse_min_interval = 500000,
        .go_hispeed_load = 90,
        .go_hispeed_load_off = 110,
        .hispeed_freq = 1517000,
        .hispeed_freq_off = 1517000,
        .io_is_busy = 1,
        .min_sample_time = 80000,
        .target_loads = "70 1306000:80 1517000:90 1805000:95",
        .target_loads_off = "95 1805000:99",
        .timer_rate = 20000,
        .timer_rate_off = 50000,
        .timer_slack = 80000,
        .scaling_max_freq = 1805000,
        .scaling_min_freq = 480000,
	.down_threshold = 256,
	.up_threshold = 665,
	.task_fork_on_bigcluster = 1,
	.max_freq = 900000000,
	.min_freq = 360000000,
	.polling_interval = 50,
    },
};

static power_profile profiles1[PROFILE_MAX] = {
    [PROFILE_POWER_SAVE] = {
        .above_hispeed_delay = "20000",
        .boost = 0,
        .boostpulse_duration = 80000,
        .boostpulse_min_interval = 500000,
        .go_hispeed_load = 99,
        .go_hispeed_load_off = 110,
        .hispeed_freq = 1209600,
        .hispeed_freq_off = 1209600,
        .io_is_busy = 0,
        .min_sample_time = 80000,
        .target_loads = "80 807000:81 1210000:85 1517000:95",
        .target_loads_off = "95 1517000:99",
        .timer_rate = 20000,
        .timer_rate_off = 50000,
        .timer_slack = 80000,
        .scaling_max_freq = 1805000,
        .scaling_min_freq = 480000,
	.down_threshold = 512,
	.up_threshold = 1024,
	.task_fork_on_bigcluster = 0,
	.max_freq = 900000000,
	.min_freq = 360000000,
	.polling_interval = 20,
    },
    [PROFILE_BALANCED] = {
        .above_hispeed_delay = "39000 1210000:89000 1517000:19000",
        .boost = 0,
        .boostpulse_duration = 80000,
        .boostpulse_min_interval = 500000,
        .go_hispeed_load = 90,
        .go_hispeed_load_off = 110,
        .hispeed_freq = 1209600,
        .hispeed_freq_off = 1209600,
        .io_is_busy = 0,
        .min_sample_time = 80000,
        .target_loads = "80 807000:81 1210000:85 1517000:95",
        .target_loads_off = "95 1517000:99",
        .timer_rate = 20000,
        .timer_rate_off = 50000,
        .timer_slack = 80000,
        .scaling_max_freq = 2516000,
        .scaling_min_freq = 480000,
	.down_threshold = 384,
	.up_threshold = 700,
	.task_fork_on_bigcluster = 1,
	.max_freq = 900000000,
	.min_freq = 360000000,
	.polling_interval = 40,
    },
    [PROFILE_HIGH_PERFORMANCE] = {
        .above_hispeed_delay = "39000 1517000:89000 1805000:19000",
        .boost = 1,
        .boostpulse_duration = 80000,
        .boostpulse_min_interval = 500000,
        .go_hispeed_load = 90,
        .go_hispeed_load_off = 110,
        .hispeed_freq = 1517000,
        .hispeed_freq_off = 1517000,
        .io_is_busy = 1,
        .min_sample_time = 80000,
        .target_loads = "80 807000:81 1210000:85 1517000:95",
        .target_loads_off = "95 1517000:99",
        .timer_rate = 20000,
        .timer_rate_off = 50000,
        .timer_slack = 80000,
        .scaling_max_freq = 2516000,
        .scaling_min_freq = 1210000,
	.down_threshold = 256,
	.up_threshold = 665,
	.task_fork_on_bigcluster = 1,
	.max_freq = 900000000,
	.min_freq = 360000000,
	.polling_interval = 50,
    },
};
