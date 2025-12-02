#!/bin/bash

# Play notification sound based on urgency
# Arguments: appname summary body icon urgency
URGENCY="${5:-normal}"

# Determine which player to use
if command -v pw-play >/dev/null 2>&1; then
    PLAYER="pw-play"
elif command -v paplay >/dev/null 2>&1; then
    PLAYER="paplay"
else
    exit 0
fi

# You can use different sounds for different urgency levels
case "$URGENCY" in
    "LOW"|"low")
        # Play a subtle sound for low urgency
        $PLAYER /usr/share/sounds/freedesktop/stereo/message.oga &
        ;;
    "NORMAL"|"normal")
        # Play standard notification sound
        $PLAYER /usr/share/sounds/freedesktop/stereo/message.oga &
        ;;
    "CRITICAL"|"critical")
        # Play attention-grabbing sound for critical notifications
        $PLAYER /usr/share/sounds/freedesktop/stereo/message.oga &
        ;;
esac
