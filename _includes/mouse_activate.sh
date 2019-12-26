#!/bin/bash
LOCATION="sudo tee /sys/bus/serio/devices/serio1/drvctl"

echo -n "none" | $LOCATION
echo -n "reconnect" | $LOCATION
trackbuttons="$(xinput list | grep TrackPoint | cut -f 2 | cut -d '=' -f 2)"
eval xinput --set-prop $trackbuttons \'libinput Accel Speed\' -0.5
trackpad="$(xinput list | grep Synaptics | cut -f 2 | cut -d '=' -f 2)"
eval xinput --set-prop $trackpad \'libinput Tapping Enabled\' 1
