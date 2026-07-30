#! /usr/bin/bash
# Stow all the hypr programs

programs=("hyprland" "hyprlock" "hypridle" "hyprpaper")

for program in "${programs[@]}"; do
    stow -v --dotfiles "$program"
done
