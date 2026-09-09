pragma Singleton

import Quickshell

import QtQuick

import qs.common

Singleton {
    id: root

    readonly property string shellThemeName: shellFont.name

    FontLoader {
        id: shellFont
        source: Settings.iconFontPath
    }

    function init() {
    }

    function get(name: string): string {
    }
}
