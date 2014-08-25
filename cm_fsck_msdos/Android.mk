#------------------------------------
# To ensure that compiled output ends up in the correct intermediates
# directory and not scattered across the disk, don't use relative paths.
# Instead, set LOCAL_PATH to the location of the original Android.mk,
# not the location of this file
#------------------------------------
LOCAL_PATH:= external/fsck_msdos

include $(CLEAR_VARS)
LOCAL_SRC_FILES := \
	boot.c \
	check.c \
	dir.c \
	fat.c \
	main.c
LOCAL_CFLAGS := -O2 -g -W -Wall -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -Dmain=fsck_msdos_main
LOCAL_C_INCLUDES := external/fsck_msdos
LOCAL_MODULE := libfsck_msdos
LOCAL_MODULE_TAGS := optional
include $(BUILD_STATIC_LIBRARY)

