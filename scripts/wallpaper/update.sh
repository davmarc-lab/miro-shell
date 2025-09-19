#!/usr/bin/env bash

CACHE_DIR="$HOME/.cache/quickshell/miro-shell/wallpaper/"
NAME="last.txt"

if [[ $# == 1 ]] ; then
    echo $1 > ${CACHE_DIR}${NAME}
fi
