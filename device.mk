#
# Copyright (C) 2011 The CyanogenMod Project
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

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

## The gps config appropriate for this device
PRODUCT_COPY_FILES += device/common/gps/gps.conf_US_SUPL:system/etc/gps.conf

## (2) Also get non-open-source specific aspects if available
$(call inherit-product-if-exists, vendor/samsung/skyrocket/skyrocket-vendor.mk)

## overlays
DEVICE_PACKAGE_OVERLAYS += device/samsung/skyrocket/overlay

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

# Ramdisk
PRODUCT_COPY_FILES += \
    device/samsung/skyrocket/ramdisk/init.qcom.rc:root/init.qcom.rc \
    device/samsung/skyrocket/ramdisk/init.qcom.sh:root/init.qcom.sh \
    device/samsung/skyrocket/ramdisk/init.qcom.usb.rc:root/init.qcom.usb.rc \
    device/samsung/skyrocket/ramdisk/init.qcom.usb.sh:root/init.qcom.usb.sh \
    device/samsung/skyrocket/ramdisk/init.target.rc:root/init.target.rc \
    device/samsung/skyrocket/ramdisk/ueventd.rc:root/ueventd.rc \
    device/samsung/skyrocket/ramdisk/init.emmc.rc:root/init.emmc.rc

# BT firmware
PRODUCT_COPY_FILES += \
    device/samsung/skyrocket/firmware/bcm4330B1.hcd:system/etc/firmware/bcm4330B1.hcd

# Vold
PRODUCT_COPY_FILES += \
    device/samsung/skyrocket/vold.fstab:system/etc/vold.fstab

# common msm8660
$(call inherit-product, device/samsung/msm8660-common/msm8660.mk)

$(call inherit-product, frameworks/base/build/phone-xhdpi-1024-dalvik-heap.mk)

$(call inherit-product-if-exists, vendor/samsung/skyrocket/skyrocket-vendor.mk)

#WIFI_BAND := 802_11_ABG
#$(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/firmware/bcm4330/device-bcm.mk)
