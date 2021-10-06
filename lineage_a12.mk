# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common Lineage stuff
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Inherit from a12 device
$(call inherit-product, $(LOCAL_PATH)/device.mk)

PRODUCT_BRAND := samsung
PRODUCT_DEVICE := a12
PRODUCT_MANUFACTURER := samsung
PRODUCT_NAME := lineage_a12
PRODUCT_MODEL := SM-A125F

PRODUCT_GMS_CLIENTID_BASE := android-samsung
TARGET_VENDOR := samsung
TARGET_VENDOR_PRODUCT_NAME := a12
PRODUCT_BUILD_PROP_OVERRIDES += PRIVATE_BUILD_DESC="a12nsxx-user 11 RP1A.200720.012 A125FXXU1BUE3 release-keys"

# Set BUILD_FINGERPRINT variable to be picked up by both system and vendor build.prop
BUILD_FINGERPRINT := samsung/a12nsxx/a12:11/RP1A.200720.012/A125FXXU1BUE3:user/release-keys
