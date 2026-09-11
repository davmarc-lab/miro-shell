pragma Singleton

import Quickshell

import QtQuick

import qs.common

Singleton {
    id: root

    readonly property string fontName: shellFont.name
    readonly property real topSpacingFactor: 0.08

    FontLoader {
        id: shellFont
        source: Settings.iconFontPath
    }

    function init() {
    }

    function get(name: string): string {
        return name;
    }
}
