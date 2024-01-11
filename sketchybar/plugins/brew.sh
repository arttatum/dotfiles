#!/bin/bash

source "$CONFIG_DIR/colors.sh"

COUNT="$(brew outdated | wc -l | tr -d ' ')"

COLOR=$RED

case $COUNT in
  [3-5][0-9])
	ICON=󱊜
	COLOR=$RED
  ;;
  [1-2][0-9])
	ICON=󱊛
	COLOR=$ORANGE
  ;;
  [1-9])
	COLOR=$YELLOW
	ICON=󱊛
  ;;
  0)
	COLOR=$GREEN
	ICON=󱊚
  ;;
esac

sketchybar --set $NAME icon.color=$COLOR icon=$ICON
