#!/bin/sh

sketchybar --add item battery right \
           --set battery update_freq=120 script="$PLUGIN_DIR/battery.sh" \
                         background.color=0xff1e1e2e \
                         background.corner_radius=5 \
                         background.border_width=1 \
                         background.border_color=0xfff2cdcd \
                         background.height=25 \
                         background.padding_left=7 \
                         background.padding_right=7 \
                         label.padding_left=7 \
                         label.padding_right=7 \
           --subscribe battery system_woke power_source_change

