#!/bin/sh
echo "CANDLE RECOVERY"
echo "in Candle Recovery ro-root.sh" >> /dev/kmsg

exec /sbin/init
