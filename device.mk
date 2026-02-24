# Inherit from vendor tree
$(call inherit-product, vendor/client/husky/husky-vendor.mk)

# Overlays
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_DIR)/overlay

# HALs
PRODUCT_PACKAGES += \
    android.hardware.audio@6.0-impl \
    android.hardware.bluetooth@1.0-impl \
    android.hardware.camera.provider@2.4-impl \
    android.hardware.graphics.composer@2.1-impl \
    android.hardware.sensors@1.0-impl \
    android.hardware.wifi@1.0-service

# MTK Specific
PRODUCT_PACKAGES += \
    libpureshot \
    libfeature_3dnr

# Properties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.mediatek.platform=MT6761 \
    ro.hardware.egl=meow \
    ro.sf.lcd_density=220 \
    qemu.hw.mainkeys=1 \
    ro.control_fallback=1

# Keylayouts
PRODUCT_COPY_FILES += \
    $(foreach f,$(wildcard $(LOCAL_DIR)/rootdir/usr/keylayout/*.kl),$(f):$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/$(notdir $(f)))
PRODUCT_COPY_FILES += $(LOCAL_DIR)/rootdir/etc/fstab.mt6761:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.mt6761

# Init scripts
PRODUCT_PACKAGES += \
    init.mt6761.rc \
    init.mtk.rc \
    init.connectivity.rc \
    fstab.mt6761

# Include all .rc files from vendor/etc/init in the build
PRODUCT_COPY_FILES += \
    $(foreach f,$(wildcard $(LOCAL_DIR)/rootdir/etc/init/*.rc),$(f):$(TARGET_COPY_OUT_VENDOR)/etc/init/$(notdir $(f))) \
    $(foreach f,$(wildcard $(LOCAL_DIR)/rootdir/etc/init/hw/*.rc),$(f):$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/$(notdir $(f)))


# Low RAM Optimization (Go Edition)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.low_ram=true \
    ro.lmk.low=1001 \
    ro.config.max_starting_bg=2 \
    persist.sys.force_highendgfx=false

# Keypad Focus Navigation
PRODUCT_PROPERTY_OVERRIDES += \
    ro.hw.keypad=true \
    ro.ui.cursor=true

