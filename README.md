# Candle update and recovery

This is part of Candle's update and recovery system, which can write partitions of the latest disk image over existing partitions on the Candle Controller. This very minimal linux installation should offer a very robust way to update the system.

### How it works
Most of the logic can be found in /etc/rc.local

rc.local runs a local candle_update.txt if it exists, and otherwise downloads the latest update script from the Candle webserver.
That script then downloads ready-made compressed disk partitions (to a ramdrive if memory permits), and extracts those files over the old system and boot partitions.

It also starts a simple python webserver so that the user can follow update progress graphically.

The removery partition itself has about 470Mb available, but uses less than that.

### Files

The update script can be found here:
https://www.candlesmarthome.com/tools/candle_update


### SSH access
If developer mode is active it will also enable SSH access during the update procedure.
username: root
password: smarthome


### Buildroot
The recovery partition is created with Buildroot:
https://github.com/createcandle/recovery_buildroot
