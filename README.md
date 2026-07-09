### exfatprogs Magisk/KSU Module
Magisk module that provides exFAT filesystem utilities for Android.

#### Includes:
 - fsck.exfat
 - mkfs.exfat
 - exfatlabel
 - tune.exfat

Supports: arm/arm64/x86/x86_64

#### Requirements:
 - Rooted Android device (Magisk/KSU)
 - Android 5.0+ (API 21+)

Build deps: Android NDK

Build: `make`

Clean: `make clean`

Installation: Flash exfatprogs.zip through Magisk/KSU

Credits:
 - [exfatprogs](https://github.com/exfatprogs/exfatprogs)
 - [e2fsprogs/libblkid](https://github.com/exfatprogs/exfatprogs)
 - [Android NDK](https://developer.android.com/ndk/)
 - [Magisk](https://github.com/topjohnwu/Magisk)
 - [KernelSU](https://kernelsu.org/)
