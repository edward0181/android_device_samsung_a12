#!bin/bash

# Go to the working directory
mkdir ~/TWRP && cd ~/TWRP
# Configure git
git config --global user.email "edwardroggeveen@gmail.com"
git config --global user.name "edward0181"
# Sync the source
repo init --depth=1 -u git://github.com/minimal-manifest-twrp/platform_manifest_twrp_aosp.git -b twrp-11
repo sync -c -q --force-sync --no-clone-bundle --no-tags -j$(nproc --all)
# Clone device tree and common tree
git clone https://github.com/edward0181/android_device_samsung_a12 -b twrp-11.0 device/samsung/a12
# Build recovery image
export ALLOW_MISSING_DEPENDENCIES=true; . build/envsetup.sh; repo sync; lunch twrp_a12-eng; mka recoveryimage
# Rename and copy the files
twrp_version=$(cat ~/TWRP/bootable/recovery/variables.h | grep "define TW_MAIN_VERSION_STR" | cut -d '"' -f2)
date_time=$(date +"%d%m%Y%H%M")
mkdir ~/final
cp recovery.img ~/final/twrp-$twrp_version-a12-"$date_time"-unofficial.img
