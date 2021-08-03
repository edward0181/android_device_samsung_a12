# Team Win Recovery Project for the Samsung Galaxy A12 (WIP)

### How to build ###

```bash
# Create dirs
$ mkdir tw; cd tw

# Init repo
$ repo init --depth=1 -u git://github.com/minimal-manifest-twrp/platform_manifest_twrp_omni.git -b twrp-10.0

# Clone a12 repo
$ git clone https://github.com/durasame/android_device_samsung_a12 -b twrp-10.0 device/samsung/a12

# Sync
$ repo sync --no-repo-verify -c --force-sync --no-clone-bundle --no-tags --optimized-fetch --prune -j`nproc`

# Build
$ source build/envsetup.sh; export ALLOW_MISSING_DEPENDENCIES=true; lunch omni_a12-eng; mka recoveryimage
```

### Credits
* mohammad92: For mkbootimg base