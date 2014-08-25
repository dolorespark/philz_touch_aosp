# Copyright 2005 The Android Open Source Project

#------------------------------------
# To ensure that compiled output ends up in the correct intermediates
# directory and not scattered across the disk, don't use relative paths.
# Instead, set LOCAL_PATH to the location of the original Android.mk
# for libmkyaffs2image, and to the directory containing this file for
# libunyaffs.
#------------------------------------

LOCAL_MAKEFILE_PATH:= $(call my-dir)

LOCAL_PATH:= external/yaffs2
include $(CLEAR_VARS)
LOCAL_SRC_FILES := \
	yaffs2/utils/mkyaffs2image.c \
	yaffs2/yaffs_packedtags2.c \
	yaffs2/yaffs_ecc.c \
	yaffs2/yaffs_tagsvalidity.c
LOCAL_CFLAGS =   -O2 -Wall -DCONFIG_YAFFS_UTIL -DCONFIG_YAFFS_DOES_ECC
LOCAL_CFLAGS+=   -Wshadow -Wpointer-arith -Wwrite-strings -Wstrict-prototypes -Wmissing-declarations
LOCAL_CFLAGS+=   -Wmissing-prototypes -Wredundant-decls -Wnested-externs -Winline
LOCAL_CFLAGS+=   -DS_IWRITE=0200 -DS_IREAD=0400
LOCAL_C_INCLUDES += external/yaffs2/yaffs2
LOCAL_MODULE := libmkyaffs2image
LOCAL_MODULE_TAGS := eng
LOCAL_CFLAGS += -Dmain=mkyaffs2image_main
LOCAL_STATIC_LIBRARIES := libselinux
include $(BUILD_STATIC_LIBRARY)

LOCAL_PATH:= $(LOCAL_MAKEFILE_PATH)
include $(CLEAR_VARS)
LOCAL_MODULE := libunyaffs
LOCAL_SRC_FILES := unyaffs.c
LOCAL_MODULE_TAGS := eng
LOCAL_CFLAGS =   -O2 -Wall -DCONFIG_YAFFS_UTIL -DCONFIG_YAFFS_DOES_ECC
LOCAL_CFLAGS+=   -Wshadow -Wpointer-arith -Wwrite-strings -Wstrict-prototypes -Wmissing-declarations
LOCAL_CFLAGS+=   -Wmissing-prototypes -Wredundant-decls -Wnested-externs -Winline
LOCAL_CFLAGS+=   -DS_IWRITE=0200 -DS_IREAD=0400
LOCAL_C_INCLUDES += $(LOCAL_PATH) external/yaffs2/yaffs2
LOCAL_CFLAGS += -Dmain=unyaffs_main
include $(BUILD_STATIC_LIBRARY)

