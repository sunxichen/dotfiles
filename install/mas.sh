#!/usr/bin/env bash

# Automatically install purchased apps from the Mac App Store

mas signout

read -r -t 60 -p "What is yout Apple ID?: " appleid
mas signin --dialog "$appleid"

# Mac App Store apps to install
apps=(
    "iMovie:408981434"
    "Keynote:409183694"
    "Magnet:441258766"
    "Numbers:409203825"
    "Pages:409201541"
    "Bear:1091189122"
    "WeChat:836500024"
    "Spark:1176895641"
    "DrUnarchiver:1127253508"
    "Maipo:789066512"
)

for app in "${apps[@]}"; do
    name=${app%%:*}
    id=${app#*:}

    echo -e "Attempting to install $name"
    mas install "$id"
done
