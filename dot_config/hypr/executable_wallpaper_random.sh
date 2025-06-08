#!/bin/bash

# Ordner mit deinen Bildern
WALLPAPER_DIR="$HOME/Pictures/wallpapers"

# Random Bild wählen
RANDOM_WALLPAPER=$(find "$WALLPAPER_DIR" -type f | shuf -n 1)

# Wallpaper setzen mit swww
swww img "$RANDOM_WALLPAPER" --transition-type any

