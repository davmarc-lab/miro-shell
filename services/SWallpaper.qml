pragma Singleton

import Quickshell

import QtQuick

import qs.common

Singleton {
    id: root

    function init(): void {
        // retrieve last wallpaper selected
    }

    property string path: Settings.wallpaperDir
    property string name: Settings.wallpaperFile
}
