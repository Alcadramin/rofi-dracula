#!/usr/bin/env bash

bold=$(tput bold)
color=$(tput setaf 3)
normal=$(tput sgr0)
arrow="${color}${bold}=>${normal}"
ROFI=".config/rofi"

echo "${arrow} Checking rofi directory exist.."

function Copy() {
    cp -vR dracula-one/ config.rasi "$HOME"/.config/rofi
    echo "${arrow} Dracula One is installed succesfully! You can start rofi with 'rofi -show drun' command!"
}

if [ -d "$HOME/${ROFI}" ]; then

    if [[ -f "$HOME/${ROFI}/config.rasi" ]] || [[ -f "$HOME/${ROFI}/dracula-one/dracula-one-dark.rasi" ]] || [[ -f "$HOME/${ROFI}/dracula-one/dracula-one-light.rasi" ]]; then
        echo "${arrow} Configuration is already exist, do you want to overwrite? (yes/no)"
        read -r PROMPT

        if [[ $PROMPT == "yes" || $PROMPT == "y" ]]; then
            Copy
        else
            exit 1
        fi
    else
        echo "${arrow} Directory exist copying files.."
        Copy
    fi
else
    echo "${arrow} Directory does not exist, trying to create.."
    mkdir "$HOME"/.config/rofi
    echo "${arrow} Copying files.."
    Copy
fi

