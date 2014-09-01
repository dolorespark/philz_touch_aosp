PhilZ Touch Recovery 6 for AOSP
===============================

Philz Home page
---------------
http://forum.xda-developers.com/showthread.php?t=2201860

About
-----
This repo allows you to build *PhilZ Touch Recovery* using your existing AOSP/non-CM Kitkat source tree. Its goal is to isolate CM-related components as much as possible so you can still produce a nearly pure AOSP ROM.

Seven additional repos are required (mostly for additional filesystem support) as well as a modest number of patches to the AOSP code itself (primarily to fix build issues). To keep its footprint as small as possible, most CM-specific libraries are generated from within the 'recovery-philz' source tree rather than modifying the AOSP 'Android.mk' files.

All of the necessary patches can be found in the 'aosp-patches' subdirectory. Also included is a 'local_manifest.xml' which identifies the additional repos needed.  Add it to the corresponding directory in your source tree so that a "repo sync" command will pull them in as well as the AOSP repos.

Two of those repos call for some explanation. 'cm_vold' is CM11's own version of 'vold' and is used because it has been so heavily modified that the AOSP version wouldn't be compatible. In contrast, 'f2fs-tools' is taken from the master branch of the Android source tree because CM11's version is badly out of date and lacks some useful features. Note that the included patches for 'f2fs-tools' are needed for any use of this package, be it Recovery or an AOSP ROM.

A final note... This version of *PhilZ Touch Recovery* includes a few enhancements that have not (yet?) been incorporated into the official source.
* For '/data' partitions whose fs_mgr flags include "encryptable=footer", this code ensures they remain encryptable by leaving space for the encryption-footer when formatting them.
* The 'updater' binary includes support for formatting and mounting F2FS partitions.
* Wherever possible, relative paths for source files have been eliminated from various 'Android.mk' files to prevent  their object files from being scattered across your disk.

DoloresPark - 2014-09-01

