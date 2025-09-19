#!/usr/bin/env bash

# This script search wallpapers in Pictures/Wallpapers folder

CACHE_DIR="$HOME/.cache/quickshell/miro-shell/wallpaper/"
WP_DIR="$HOME/Pictures/Wallpapers/"

NAME="last.txt"

# if the cache file is not found create it and choose the first 
# wallpaper in WP_DIR
if [[ ! -e "${CACHE_DIR}$NAME" ]] then
    touch ${CACHE_DIR}$NAME
    echo `ls -1 $WP_DIR | head -n 1` > ${CACHE_DIR}$NAME
fi

# print the wallpaper name
echo `cat ${CACHE_DIR}$NAME`
