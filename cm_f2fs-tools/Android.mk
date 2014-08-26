#------------------------------------
# To ensure that compiled output ends up in the correct intermediates
# directory and not scattered across the disk, don't use relative paths.
# Instead, set LOCAL_PATH to the location of the original Android.mk,
# not the location of this file
#------------------------------------
LOCAL_PATH:= external/f2fs-tools

# f2fs-tools depends on Linux kernel headers being in the system include path.
ifeq ($(HOST_OS),linux)

# The versions depend on $(LOCAL_PATH)/VERSION
version_CFLAGS := -DF2FS_MAJOR_VERSION=1 -DF2FS_MINOR_VERSION=2 -DF2FS_TOOLS_VERSION=\"1.2.0\" -DF2FS_TOOLS_DATE=\"2013-10-25\"

# external/e2fsprogs/lib is needed for uuid/uuid.h
common_C_INCLUDES := $(LOCAL_PATH)/include external/e2fsprogs/lib/

#----------------------------------------------------------
include $(CLEAR_VARS)
LOCAL_MODULE := libcm_f2fs_fmt
LOCAL_SRC_FILES := \
	lib/libf2fs.c \
	lib/libf2fs_io.c \
	mkfs/f2fs_format.c \
	mkfs/f2fs_format_utils.c \
	mkfs/f2fs_format_main.c \

LOCAL_C_INCLUDES := $(common_C_INCLUDES)
LOCAL_CFLAGS := $(version_CFLAGS) -Dmain=make_f2fs_main
LOCAL_EXPORT_CFLAGS := $(version_CFLAGS)
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/include $(LOCAL_PATH)/mkfs
LOCAL_STATIC_LIBRARIES := libext2_uuid_static
include $(BUILD_STATIC_LIBRARY)

#----------------------------------------------------------
include $(CLEAR_VARS)
LOCAL_MODULE := libcm_fsck_f2fs
LOCAL_SRC_FILES := \
	fsck/dump.c \
	fsck/fsck.c \
	fsck/main.c \
	fsck/mount.c \
	lib/libf2fs.c \
	lib/libf2fs_io.c \

LOCAL_C_INCLUDES := $(common_C_INCLUDES)
LOCAL_CFLAGS := $(version_CFLAGS) -Dmain=fsck_f2fs_main
LOCAL_MODULE_TAGS := optional
include $(BUILD_STATIC_LIBRARY)

#----------------------------------------------------------
include $(CLEAR_VARS)
LOCAL_MODULE := libcm_fibmap_f2fs
LOCAL_SRC_FILES := tools/fibmap.c
LOCAL_CFLAGS := $(version_CFLAGS) -Dmain=fibmap_main -Dprint_stat=fibmap_print_stat
LOCAL_MODULE_TAGS := optional
include $(BUILD_STATIC_LIBRARY)

endif
