#!/bin/bash

update() {
  source "$CONFIG_DIR/colors.sh"
  COLOR=$BACKGROUND_2
  if [ "$SELECTED" = "true" ]; then
    COLOR=$GREY
  fi
  sketchybar --set $NAME icon.highlight=$SELECTED \
                         label.highlight=$SELECTED \
                         background.border_color=$COLOR
}

switch_workspace() {
	weird_apple_number=""
	case "$1" in
		"1")
			weird_apple_number="18"
		;;
		"2")
			weird_apple_number="19"
		;;
		"3")
			weird_apple_number="20"
		;;
		"4")
			weird_apple_number="21"
		;;
		"5")
			weird_apple_number="23"
		;;
		"6")
			weird_apple_number="22"
			;;
		"7")
			weird_apple_number="26"
		;;
		"8")
			weird_apple_number="28"
		;;
		"9")
			weird_apple_number="25"
		;;
	esac

	osascript -e "tell application \"System Events\" to key code $weird_apple_number using control down"

}

mouse_clicked() {
  if [ "$BUTTON" = "right" ]; then
    yabai -m space --destroy $SID
    sketchybar --trigger windows_on_spaces --trigger space_change
  else
	switch_workspace $SID
  fi
}

case "$SENDER" in
  "mouse.clicked") mouse_clicked
  ;;
  *) update
  ;;
esac
