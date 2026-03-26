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

if [[ ! -e "${CACHE_DIR}user/data.json" ]] then
    touch "${CACHE_DIR}user/data.json"
    echo "-- cache: --user file \"data.json\" created"
fi

# create todo cache dir
if [[ ! -e "${CACHE_DIR}todo/" ]] then
    mkdir "${CACHE_DIR}todo"
    echo "-- cache: todo dir created--"
fi

# create weather cache dir
if [[ ! -e "${CACHE_DIR}weather/" ]] then
    mkdir "${CACHE_DIR}weather"
    echo "-- cache: weather dir created--"
fi

# create calendar cache dir
if [[ ! -e "${CACHE_DIR}calendar/" ]] then
    mkdir "${CACHE_DIR}calendar"
    echo "-- cache: calendar dir created--"
fi
