#!/usr/bin/env bash

CACHE_DIR="$HOME/.cache/quickshell/miro-shell/"

# prepare cache dir
if [[ ! -e $CACHE_DIR ]] then
    mkdir -p $CACHE_DIR
    echo "Cache dir created"
fi

# create wallpaper cache dir
if [[ ! -e "${CACHE_DIR}wallpaper/" ]] then
    mkdir "${CACHE_DIR}wallpaper"
    echo "-- cache: wallpaper dir created--"
fi

# create network cache dir
if [[ ! -e "${CACHE_DIR}network/" ]] then
    mkdir "${CACHE_DIR}network"
    echo "-- cache: network dir created--"
fi

# create user cache dir
if [[ ! -e "${CACHE_DIR}user/" ]] then
    mkdir "${CACHE_DIR}user"
    echo "-- cache: user dir created--"
fi
