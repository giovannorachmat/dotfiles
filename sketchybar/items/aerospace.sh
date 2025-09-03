#!/bin/sh

sketchybar --add event aerospace_workspace_change

sketchybar --add item space left \
          --subscribe space aerospace_workspace_change \
          --set space \
              script="$PLUGIN_DIR/aerospace.sh" \
              background.color=0xff1e1e2e \
              background.corner_radius=5 \
              background.border_width=1 \
              background.border_color=0xff89b4fa \
              background.height=25 \
              background.padding_right=7 \
              background.drawing=on \
              label.padding_left=7 \
              label.padding_right=7

sketchybar --add bracket spaces '/space\..*/' \
           --set spaces background.color=0xff1e1e2e \
                        background.corner_radius=5 \
                        background.border_width=1 \
                        background.border_color=0xff89b4fa \
                        background.height=25
