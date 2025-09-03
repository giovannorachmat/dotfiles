sketchybar --add item front_app left \
           --subscribe front_app front_app_switched \
           --set front_app icon.drawing=off script="$PLUGIN_DIR/front_app.sh" \
                           background.color=0xff1e1e2e \
                           background.corner_radius=5 \
                           background.border_width=1 \
                           background.border_color=0xff89b4fa \
                           background.height=25 \
                           background.padding_left=7 \
                           background.padding_right=7 \
                           label.padding_left=7 \
                           label.padding_right=7

