#!/bin/sh

FOCUSED_WORKSPACE=$(aerospace list-workspaces --focused)

case $FOCUSED_WORKSPACE in
    "1"|"code")
      LABEL="💻 code"
      ;;
    "2"|"comms")
      LABEL="💬 comms"
      ;;
    "3"|"browse")
      LABEL="🌐 browse"
      ;;
    "4"|"research")
      LABEL="📖 research"
      ;;
    "5"|"fun")
        LABEL="✨ fun"
        ;;
      *)
        LABEL="$FOCUSED_WORKSPACE"
        ;;
esac

sketchybar --set space label="$LABEL"

# FOCUSED_WORKSPACE=$(aerospace list-workspaces --focused)
# sketchybar --set space label="$FOCUSED_WORKSPACE"

# if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
#     sketchybar --set $NAME background.drawing=on
# else
#     sketchybar --set $NAME background.drawing=off
# fi
