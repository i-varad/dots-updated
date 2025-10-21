#!/usr/bin/env bash

#!/bin/bash

# Launch polybar on internal monitor (eDP)
if xrandr | grep "$INTERNAL_MONITOR" | grep "connected"; then
    MONITOR=$INTERNAL_MONITOR polybar --reload example &
fi

