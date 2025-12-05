#!/usr/bin/env bash

CACHE_DIR="$HOME/.cache/quickshell/miro-shell/weather/"
FILE="data.json"

URL="https://api.open-meteo.com/v1/forecast?latitude=44.1391&longitude=12.2431&daily=weather_code,temperature_2m_max,temperature_2m_min&hourly=temperature_2m,relative_humidity_2m,weather_code&current=temperature_2m,relative_humidity_2m,precipitation&timezone=Europe%2FBerlin"

curl -X GET $URL > $CACHE_DIR$FILE
