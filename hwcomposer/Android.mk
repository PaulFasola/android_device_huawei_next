# This software is licensed under the terms of the GNU General Public
# License version 2, as published by the Free Software Foundation, and
# may be copied, distributed, and modified under those terms.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := hwcomposer.$(TARGET_BOARD_PLATFORM)
LOCAL_MODULE_RELATIVE_PATH := hw/
LOCAL_SRC_FILES :=HwComposer.cpp HwComposer_vsync.cpp
LOCAL_SHARED_LIBRARIES := liblog \
			  libcutils \
			  libbinder \
			  libhardware \
			  libsync \
			  libutils \
			  libsync \
			  libion \
			  libEGL \
			  libGLESv2

LOCAL_CFLAGS := -Wno-unused-parameter
LOCAL_C_INCLUDES += \
        $(TOP)/hardware/libhardware/modules/gralloc \
	$(TOP)/hardware/libhardware/include/hardware

include $(BUILD_SHARED_LIBRARY)

