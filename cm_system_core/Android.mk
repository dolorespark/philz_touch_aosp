#------------------------------------
# To ensure that compiled output ends up in the correct intermediates
# directory and not scattered across the disk, don't use relative paths.
# Instead, set LOCAL_PATH for each library to the location of the original
# Android.mk, not the location of this file
#------------------------------------

LOCAL_PATH:= system/core/libdiskconfig
include $(CLEAR_VARS)
LOCAL_SRC_FILES := \
	diskconfig.c \
	diskutils.c \
	write_lst.c \
	config_mbr.c
LOCAL_MODULE := libdiskconfig
LOCAL_MODULE_TAGS := optional
include $(BUILD_STATIC_LIBRARY)

#------------------------------------

## Crippled version without an RSA implementation
## to coexist with libcrypto_static and provide SHA_hash
LOCAL_PATH:= system/core/libmincrypt
include $(CLEAR_VARS)
LOCAL_MODULE := libminshacrypt
LOCAL_SRC_FILES := \
	sha.c \
	sha256.c
include $(BUILD_STATIC_LIBRARY)

#------------------------------------

# Reboot static library
LOCAL_PATH := system/core/reboot
include $(CLEAR_VARS)
LOCAL_MODULE := libreboot_static
LOCAL_MODULE_TAGS := optional
LOCAL_CFLAGS := -Dmain=reboot_main
LOCAL_SRC_FILES := reboot.c
include $(BUILD_STATIC_LIBRARY)

#------------------------------------

LOCAL_PATH:= system/core/sdcard
include $(CLEAR_VARS)
LOCAL_SRC_FILES := sdcard.c
LOCAL_C_INCLUDES := system/core/sdcard
LOCAL_MODULE := libsdcard
LOCAL_CFLAGS := -Wall -Wno-unused-parameter -Dmain=sdcard_main
LOCAL_MODULE_TAGS := optional
include $(BUILD_STATIC_LIBRARY)

#------------------------------------

LOCAL_PATH:= system/core/libsysutils
include $(CLEAR_VARS)
LOCAL_SRC_FILES:= \
	src/SocketListener.cpp      \
	src/FrameworkListener.cpp   \
	src/NetlinkListener.cpp     \
	src/NetlinkEvent.cpp        \
	src/FrameworkCommand.cpp    \
	src/SocketClient.cpp        \
	src/ServiceManager.cpp      \
	EventLogTags.logtags

LOCAL_MODULE:= libsysutils
LOCAL_C_INCLUDES := $(KERNEL_HEADERS)
LOCAL_CFLAGS :=
include $(BUILD_STATIC_LIBRARY)

