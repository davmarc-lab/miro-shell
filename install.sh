#!/usr/bin/env bash

FONT_DIR="./assets/fonts"

# ============================
# Install Material Symbols
# ============================
MATERIAL_SYMBOLS_DIR="${FONT_DIR}/Material-Symbols"
MATERIAL_SYMBOLS_ROUND_LINK="https://github.com/google/material-design-icons/raw/master/variablefont/MaterialSymbolsRounded%5BFILL%2CGRAD%2Copsz%2Cwght%5D.ttf"
MATERIAL_SYMBOLS_ROUND_FILE="${MATERIAL_SYMBOLS_DIR}/material-symbols-rounded.ttf"

if [[ ! -e "${MATERIAL_SYMBOLS_DIR}" ]] then
    mkdir -p ${MATERIAL_SYMBOLS_DIR}
    echo "-- Material Symbols font dir created"
else
    echo "-- skipping -- Material Symbols dir exists"
fi

if [[ ! -e $MATERIAL_SYMBOLS_ROUND_FILE ]] then
    echo "-- Downloading Materyal Symbols Roundend font"
    curl -L -o $MATERIAL_SYMBOLS_ROUND_FILE $MATERIAL_SYMBOLS_ROUND_LINK
    if [[ $? -eq 0 ]] then
        echo "-- Created: Materyal Symbols Roundend font"
    else
        echo "[ERROR] Failed to retrieve: ${MATERIAL_SYMBOLS_ROUND_LINK}"
        exit 1
    fi
else
    echo "-- skipping -- Material Symbols Rounded font exists"
fi
