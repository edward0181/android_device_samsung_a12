# Team Win Recovery Project for the Samsung Galaxy A12 (WIP)
Added custom kernel building
Working all, except ENCRYPT / DECRYPT

Thanks @Physwizz for kernel sources.

### How to build ###

```bash
# Create dirs
$ mkdir tw; cd tw

# Init repo
$ repo init --depth=1 -u git://github.com/minimal-manifest-twrp/platform_manifest_twrp_aosp.git -b twrp-11


# Clone a12 repo
$ git clone https://github.com/edward0181/android_device_samsung_a12 -b twrp-11.0 device/samsung/a12

# Clone a12 kernel
$ git clone https://github.com/physwizz/a125f.git kernel/samsung/a12

# Sync
$ repo sync --no-repo-verify -c --force-sync --no-clone-bundle --no-tags --optimized-fetch --prune -j`nproc`

# Build
$ source build/envsetup.sh; export ALLOW_MISSING_DEPENDENCIES=true; lunch twrp_a12-eng; mka recoveryimage
```
