#!/bin/sh

echo "CANDLE RECOVERY"
echo "in Candle Recovery ro-root.sh" >> /dev/kmsg
echo "Starting Candle Update and Recovery" >> /boot/candle_log.txt

early="Candle restore: Howdy world!"
if grep -qs "(mmcblk0p1): Volume was not properly unmounted." dmesg;
then
  echo "candle: ro-root: DOING FSCK OF /BOOT"
  #early+=$'\nDOING FSCK OF /BOOT'
  early="DOING FSCK OF /BOOT"
  fsck.vfat /dev/mmcblk0p1 -a -v -V
fi

if [ -d "/boot" ]; then
  mount -t vfat /dev/mmcblk0p1 /boot
  #ls /dev > /boot/ls_dev.txt

  # write results from early disk checks to log
  if [ -n "$early" ]; then
    echo "$early" >> /boot/candle_log.txt
  fi

  PYTHONINSTALLED=$(which python3)
  echo "Recovery python: $PYTHONINSTALLED" >> /boot/candle_log.txt 
fi

echo "zzz 5 seconds"
sleep 5

echo "downloading and running upgrade script" >> /dev/kmsg
echo "downloading and running upgrade script" >> /boot/candle_log.txt
echo "downloading and running upgrade script"
wget http://www.candlesmarthome.com/tools/system_update.sh -O - | sh
