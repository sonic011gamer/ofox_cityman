#
# Copyright (C) 2017 The Android Open-Source Project
#
# Copyright (C) 2019-2020 OrangeFox Recovery Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

LOCAL_PATH := device/microsoft/cityman

TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_SMP := true
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_VARIANT := generic

TARGET_2ND_ARCH := arm
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53
TARGET_2ND_ARCH_VARIANT := armv7-a-neon

TARGET_NO_BOOTLOADER := true

BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_TAGS_OFFSET := 0x00000100
BOARD_RAMDISK_OFFSET := 0x02000000
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset $(BOARD_RAMDISK_OFFSET) --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.console=ttyHSL0 androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x37 ehci-hcd.park=3 lpm_levels.sleep_disabled=1 boot_cpus=0-7 androidboot.selinux=permissive

ifeq ($(FOX_BUILD_FULL_KERNEL_SOURCES),1111)
   BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
   TARGET_KERNEL_CONFIG := lineageos_bullhead_defconfig
   TARGET_KERNEL_SOURCE := kernel/microsoft/talkman
else
   TARGET_PREBUILT_KERNEL := $(LOCAL_PATH)/prebuilt/Image.gz-dtb
ifeq ($(FOX_USE_STOCK_KERNEL),1)
   TARGET_PREBUILT_KERNEL := $(LOCAL_PATH)/prebuilt/Image-twrp.gz-dtb
   # this twrp kernel has touchscreen issues
endif
PRODUCT_COPY_FILES += \
    $(TARGET_PREBUILT_KERNEL):kernel
endif
TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/recovery.fstab
TW_DEFAULT_LANGUAGE := en
#
# DJ9 - 17 July 2019
# !!! don't enable this - it will cause spontaneous reboots in some locales !!!
# TW_EXTRA_LANGUAGES := true
#

TARGET_PLATFORM_DEVICE_BASE := /devices/soc.0/
TARGET_BOARD_PLATFORM := msm8994
TARGET_BOOTLOADER_BOARD_NAME := msm8994

TARGET_HW_DISK_ENCRYPTION := true
TARGET_KEYMASTER_WAIT_FOR_QSEE := true
TW_INCLUDE_CRYPTO := true

BOARD_HAS_NO_REAL_SDCARD := true
RECOVERY_SDCARD_ON_DATA := true
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
BOARD_BOOTIMAGE_PARTITION_SIZE     := 67108864
BOARD_CACHEIMAGE_PARTITION_SIZE    := 402653184
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864
BOARD_SYSTEMIMAGE_PARTITION_SIZE   := 2013265920
BOARD_USERDATAIMAGE_PARTITION_SIZE := 12469648896
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_FLASH_BLOCK_SIZE := 131072

TARGET_USES_ION := true
TARGET_RECOVERY_QCOM_RTC_FIX := true
BOARD_CHARGER_ENABLE_SUSPEND := true
BOARD_HAS_NO_SELECT_BUTTON := true

DEVICE_RESOLUTION := 1440x2560
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
TW_BRIGHTNESS_PATH := /sys/class/leds/lcd-backlight/brightness
#
