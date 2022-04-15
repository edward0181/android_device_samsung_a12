LOCAL_PATH := device/samsung/a12

include $(CLEAR_VARS)

# ALL_PREBUILT += $(INSTALLED_KERNEL_TARGET)

# include the non-open-source counterpart to this file

-include device/samsung/a12/BoardConfigVendor.mk

 ifeq ($(TARGET_DEVICE), a12)
 include $(call all-subdir-makefiles,$(LOCAL_PATH))
 endif