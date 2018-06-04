#!/sbin/sh

sku=`getprop ro.boot.hardware.sku`

if [ "$sku" = "XT1687" ]; then
    # XT1687 doesn't have NFC chip
    rm /vendor/etc/permissions/android.hardware.nfc.xml
    rm /vendor/etc/permissions/android.hardware.nfc.hce.xml
    rm /vendor/etc/permissions/com.android.nfc_extras.xml
    rm -r /system/app/NfcNci
else
    # Only XT1687 variant got a compass
    rm /vendor/etc/permissions/android.hardware.sensor.compass.xml
fi

if ! [ "$sku" = "XT1683" ]; then
    # Others variants doesn't have DTV support
    rm /vendor/etc/permissions/com.motorola.hardware.dtv.xml
    rm /vendor/etc/permissions/mot_dtv_permissions.xml
    rm /vendor/bin/hw/motorola.hardware.tv@1.0-service
    rm /vendor/etc/init/motorola.hardware.tv@1.0-service.rc
    rm /vendor/lib/libdtvtuner.so
    rm /vendor/lib/hw/motorola.hardware.tv@1.0-impl.so
    rm /vendor/lib/motorola.hardware.tv@1.0.so
    rm /vendor/lib/motorola.hardware.tv@1.0_vendor.so
    rm /vendor/lib64/libdtvtuner.so
    rm /vendor/lib64/hw/motorola.hardware.tv@1.0-impl.so
    rm /vendor/lib64/motorola.hardware.tv@1.0.so
    rm /vendor/lib64/motorola.hardware.tv@1.0_vendor.so
    rm -r /vendor/app/DTVPlayer
    rm -r /vendor/app/DTVService
fi

