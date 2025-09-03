#!/bin/sh

sketchybar --add item calendar right \
           --set calendar update_freq=10 icon=􀉉 script="$PLUGIN_DIR/calendar.sh" \
                          background.color=0xff1e1e2e \
                          background.corner_radius=5 \
                          background.border_width=1 \
                          background.border_color=0xfff38ba8 \
                          background.height=25 \
                          background.padding_left=7 \
                          background.padding_right=7 \
                          label.padding_left=7 \
                          label.padding_right=7

