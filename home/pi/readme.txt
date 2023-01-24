You are now in the Candle recovery partition. It's main purpose is to download disk images and write those over the existing partitions. 

When this process ends it should automatically reboot to the normal Candle partition, so be quick. Alternatively, next time create a file called update_candle.txt in /boot with this content:

#!/bin/bash
sleep 9999999

That will override the normal flow, and should give you a lot of time to do whatever you want.

Normally an update script is downloaded from the Candle webserver by /etc/rc.local:
https://www.candlesmarthome.com/tools/candle_update

You can look at that for more hints on what you can do here.


When done (and if the system is not doing an update!), type:

reboot -f


