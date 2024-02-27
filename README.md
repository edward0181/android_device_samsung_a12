## Recovery Device Tree for the Samsung Galaxy A12 (MTK)

## How-to compile it:

# Create dirs
$ mkdir tw; cd tw

# Init repo
$ repo init --depth=1 -u https://github.com/minimal-manifest-twrp/platform_manifest_twrp_aosp.git -b twrp-12.1

# Clone a12 repo
$ git clone https://github.com/TeamWin/android_device_samsung_a12 -b android-12.1 device/samsung/a12

# Clone a12 kernel
$ git clone https://github.com/edward0181/android_kernel_samsung_a12 kernel/samsung/a12

# Sync
$ repo sync --no-repo-verify -c --force-sync --no-clone-bundle --no-tags --optimized-fetch --prune -j`nproc`

# Build
$ source build/envsetup.sh; export ALLOW_MISSING_DEPENDENCIES=true; lunch twrp_a12-eng; mka recoveryimage

# Disable File Based Encryption (FBE) after installing TWRP.
$ Boot TWRP; format DATA partition; start TWRP SHELL; execute: multidisabler.
Your DATA partition will be secured against re-encryption.

# Thanks to.
@Edwin0305 for his adds to Android-12.1 tree