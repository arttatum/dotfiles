#!/usr/bin/env sh
STATUS_LABEL=$(lsappinfo info -only StatusLabel "Slack")
ICON="󰒱"
source "$CONFIG_DIR/colors.sh"
if [[ $STATUS_LABEL =~ \"label\"=\"([^\"]*)\" ]]; then
    LABEL="${BASH_REMATCH[1]}"

    if [[ $LABEL == "" ]]; then
        ICON_COLOR=$GREEN
    elif [[ $LABEL == "•" ]]; then
		LABEL=""
        ICON_COLOR=$GREEN
    elif [[ $LABEL =~ ^[0-9]+$ ]]; then
        ICON_COLOR=$RED
    else
        exit 0
    fi
else
  exit 0
fi

sketchybar --set $NAME icon=$ICON label=$LABEL icon.color=$ICON_COLOR
