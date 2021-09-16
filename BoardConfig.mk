#
# Copyright (C) 2020 The Android Open Source Project
# Copyright (C) 2020 The TWRP Open Source Project
# Copyright (C) 2020 SebaUbuntu's TWRP device tree generator
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

DEVICE_PATH := device/samsung/a12

# For building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_BOARD_SUFFIX := _64
TARGET_USES_64_BIT_BINDER := true

# Assert
TARGET_OTA_ASSERT_DEVICE := a12

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := SRPTH05D001

# These two are for MTK Chipsets only
BOARD_USES_MTK_HARDWARE := true
BOARD_HAS_MTK_HARDWARE := true

# Platform
TARGET_BOARD_PLATFORM := mt6765

# File systems
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 33554432
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 40894464 # This is the maximum known partition size, but it can be higher, so we just omit it
BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
TARGET_COPY_OUT_VENDOR := vendor

##test##
BOARD_USES_METADATA_PARTITION := true
RECOVERY_SDCARD_ON_DATA := true

# Dynamic Partition
BOARD_SUPER_PARTITION_SIZE := 0x107800000
BOARD_SUPER_PARTITION_GROUPS := samsung_dynamic_partitions
BOARD_SAMSUNG_DYNAMIC_PARTITIONS_SIZE := 0x107800000
BOARD_SAMSUNG_DYNAMIC_PARTITIONS_PARTITION_LIST := system vendor product odm

# Kernel
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2 androidboot.selinux=permissive
BOARD_BOOTIMG_HEADER_VERSION := 2
BOARD_KERNEL_BASE := 0x40078000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_RAMDISK_OFFSET := 0x11a88000
BOARD_KERNEL_TAGS_OFFSET := 0x07808000
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)

BOARD_KERNEL_IMAGE_NAME := Image.gz
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64
TARGET_KERNEL_CONFIG := a12_defconfig
TARGET_KERNEL_SOURCE := kernel/samsung/a12
TARGET_KERNEL_CROSS_COMPILE_PREFIX := aarch64-linux-android-
TARGET_KERNEL_CLANG_COMPILE := true


###building with kernel source, so commented###
#TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/Image.gz
#TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilt/dtb.img
#BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/prebuilt/dtbo.img
BOARD_INCLUDE_RECOVERY_DTBO := true
#BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
#BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
#BOARD_MKBOOTIMG_ARGS += --dtb $(TARGET_PREBUILT_DTB)
#BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOTIMG_HEADER_VERSION)



# Hack: prevent anti rollback
PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH := 2099-12-31
PLATFORM_VERSION := 16.1.0
TW_INCLUDE_CRYPTO := false


# TWRP Configuration
TW_THEME := portrait_hdpi
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_USE_TOOLBOX := true
TW_NO_REBOOT_BOOTLOADER := true
TW_INCLUDE_FUSE_EXFAT := true
TW_HAS_DOWNLOAD_MODE := true
TW_INCLUDE_FUSE_NTFS := true
TW_EXTRA_LANGUAGES := true
TARGET_USES_MKE2FS := true
TW_EXCLUDE_TWRPAPP := true
TWRP_INCLUDE_LOGCAT := true
TW_INCLUDE_FB2PNG := true
TARGET_USES_LOGD := true
TW_INCLUDE_NTFS_3G := true
TW_SCREEN_BLANK_ON_BOOT := true
TW_BRIGHTNESS_PATH := "/sys/class/leds/lcd-backlight/brightness"
TW_MAX_BRIGHTNESS := 255
TW_DEFAULT_BRIGHTNESS := 255
TW_INPUT_BLACKLIST := "hbtp_vm"