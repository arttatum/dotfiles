sketchybar  --add   item slack right \
            --set   slack \
                    update_freq=10 \
                    script="$PLUGIN_DIR/slack_notifs.sh" \
                    icon.font.size=18 \
           --subscribe slack system_woke
