#!/usr/bin/bash

if [ ! -f /data/ota_updates ]; then
    /usr/bin/touch /data/no_ota_updates
fi

if [ ! -f "/data/KRset" ]; then
    sleep 3
    mount -o remount,rw /system
    cp -rf /data/openpilot/kyd/fonts.xml /system/etc/fonts.xml
    chmod 644 /system/etc/fonts.xml
    mount -o remount,r /system
	
	setprop persist.sys.locale ko-KR
	setprop persist.sys.local ko-KR

	/usr/bin/touch /data/KRset
fi

export PASSIVE="0"
exec ./launch_chffrplus.sh

