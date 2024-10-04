#!/system/bin/sh

# This script checks the current brightness
# and offsets the values. It could surely 
# be made more robust. Currently un-tested 
# on Oxygen OS.

BRIGHTNESS_FILE=/sys/class/leds/lcd-backlight/brightness

BRIGHTNESS=$(cat ${BRIGHTNESS_FILE})

if uname -r | grep niigo || [ -f "/sdcard/.lb" ]; then
  LB=1
fi

#echo $BRIGHTNESS

if [[ ${BRIGHTNESS} >= 970 ]]; then

  echo 2047 > ${BRIGHTNESS_FILE}

elif [[ ${BRIGHTNESS} >= 920 ]]; then

  echo 1998 > ${BRIGHTNESS_FILE}

elif [[ ${BRIGHTNESS} >= 900 ]]; then

  echo 1942 > ${BRIGHTNESS_FILE}

fi

[ -z "$LB" ] && exit 0

if [[ ${BRIGHTNESS} == 20 ]]; then

  echo 18 > ${BRIGHTNESS_FILE}

elif [[ ${BRIGHTNESS} == 16 ]]; then

  echo 12 > ${BRIGHTNESS_FILE}

elif [[ ${BRIGHTNESS} == 13 ]]; then

  echo 6 > ${BRIGHTNESS_FILE}

exit 0
