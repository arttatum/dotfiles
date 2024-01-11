#!/bin/bash
status_bracket=(
  background.color=$BACKGROUND_1
  background.border_color=$BACKGROUND_2
)
# sketchybar --add bracket status spotify brew wifi volume_icon yubi acme \
sketchybar --add bracket status brew wifi volume_icon acme yubi slack calendar  \
           --set status "${status_bracket[@]}"
