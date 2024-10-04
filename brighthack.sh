#!/system/bin/sh

# This script checks the current brightness
# and offsets the values. It could surely 
# be made more robust. Currently un-tested 
# on Oxygen OS.

BRIGHTNESS_FILE=/sys/class/leds/lcd-backlight/brightness

BRIGHTNESS=$(cat ${BRIGHTNESS_FILE})

# TODO! properly detect AAL status somehow instead of hardcoding our localversion
#       defconfig grep-ing does not work as we spoof stock defconfig
#       AAL does not seem to provide any procfs / sysfs changes when its disabled
#       fck you Mediatek :D
if uname -r | grep niigo || [ -f "/sdcard/.lb" ]; then
  LB=1
fi

#echo $BRIGHTNESS

if [ ${BRIGHTNESS} -gt 970 ]; then

  echo 2047 > ${BRIGHTNESS_FILE}

elif [ ${BRIGHTNESS} -gt 920 ]; then

  echo 1998 > ${BRIGHTNESS_FILE}

elif [ ${BRIGHTNESS} -gt 900 ]; then

  echo 1942 > ${BRIGHTNESS_FILE}

fi

[ -z "$LB" ] && exit 0

if [ ${BRIGHTNESS} -eq 20 ]; then

  echo 18 > ${BRIGHTNESS_FILE}

elif [ ${BRIGHTNESS} -eq 16 ]; then

  echo 12 > ${BRIGHTNESS_FILE}

elif [ ${BRIGHTNESS} -eq 13 ]; then

  echo 6 > ${BRIGHTNESS_FILE}

fi

exit 0
