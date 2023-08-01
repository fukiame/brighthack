#!/system/bin/sh

# This script checks the current brightness
# and offsets the values. It could surely 
# be made more robust. Currently un-tested 
# on Oxygen OS.

BRIGHTNESS_FILE=/sys/class/leds/lcd-backlight/brightness

BRIGHTNESS=$(cat ${BRIGHTNESS_FILE})

#echo $BRIGHTNESS

if [[ ${BRIGHTNESS} == 397 ]]; then

  echo 90 > ${BRIGHTNESS_FILE}

fi

exit 0
