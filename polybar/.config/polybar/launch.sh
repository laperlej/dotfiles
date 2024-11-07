#!/usr/bin/env bash

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use 
polybar-msg cmd quit
# Otherwise you can use the nuclear option:
# killall -q polybar

# Launch bar1 and bar2
echo "---" | tee -a /tmp/polybar1.log
#if 2 monitors, use left right, if 1 monitor, use single
if xrandr | grep "HDMI-1 connected"; then
    polybar left 2>&1 | tee -a /tmp/polybar1.log &
    polybar right1 2>&1 | tee -a /tmp/polybar1.log &
elif xrandr | grep "DP-1-1 connected"; then
    polybar left 2>&1 | tee -a /tmp/polybar1.log &
    polybar right2 2>&1 | tee -a /tmp/polybar1.log &
elif xrandr | grep "DP-2-1 connected"; then
    polybar left 2>&1 | tee -a /tmp/polybar1.log &
    polybar right3 2>&1 | tee -a /tmp/polybar1.log &
else
    polybar single 2>&1 | tee -a /tmp/polybar1.log &
fi

echo "Bars launched..."
