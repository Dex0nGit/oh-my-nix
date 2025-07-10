#!/bin/bash

# Define o wallpaper e gera o tema
wal -i ~/Pictures/uuu.png

# Recarrega a Waybar (para aplicar cores do colors-waybar.css)
pkill waybar && waybar &
