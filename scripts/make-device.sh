#!/bin/bash
set -ev
#installing needed appts
source ~/.bashrc
# Create dirs
mkdir tw; cd tw

# Init repo
repo init --depth=1 -u git://github.com/minimal-manifest-twrp/platform_manifest_twrp_aosp.git -b twrp-11

# Clone a12 repo
git clone https://github.com/edward0181/android_device_samsung_a12 -b twrp-11.0 device/samsung/a12

# Sync
repo sync --no-repo-verify -c --force-sync --no-clone-bundle --no-tags --optimized-fetch --prune -j`nproc`

# Build
source build/envsetup.sh; export ALLOW_MISSING_DEPENDENCIES=true; lunch twrp_a12-eng; mka recoveryimage
