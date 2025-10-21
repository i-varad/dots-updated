#!/bin/sh

INTERNAL="eDP"
EXTERNAL="HDMI-A-0"

# Detect if external is connected
if xrandr | grep "$EXTERNAL connected" >/dev/null; then
    echo "External monitor detected"

    # Position external monitor to the LEFT of internal
    xrandr --output $INTERNAL --primary --auto \
           --output $EXTERNAL --auto --left-of $INTERNAL

    # Reset bspwm monitors
  

    # Assign desktops
    bspc monitor $EXTERNAL -d 1 2 3
    bspc monitor $INTERNAL -d 4 5 6

else
    echo "Only internal monitor active"

    xrandr --output $EXTERNAL --off --output $INTERNAL --auto --primary



    bspc monitor $INTERNAL -d 1 2 3 4 5 6
fi

