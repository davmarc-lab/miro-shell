pragma Singleton

import Quickshell

import QtQuick

import qs.common

Singleton {
    id: root

    readonly property string fontName: shellFont.name
    readonly property real topSpacingFactor: 0.08
    readonly property var shellIcons: {
        "settings": "\u{e8b8}",
        "colorscheme": "\u{e40a}",
        "menu": "\u{e5d2}",
        "controls": "\u{e30f}",
        "gallery": "\u{e3f4}",
        "power": "\u{e8ac}",
        "forward": "\u{e5e1}",
        "backward": "\u{e2ea}",
        "expand": "\u{e5cc}",
        "expanded": "\u{e313}",
        "cancel": "\u{e5c9}",
        "dark-mode": "\u{e51c}",
        "light-mode": "\u{e518}",
        "date": "\u{ebcc}",
        "time": "\u{f540}",
        "timer": "\u{e425}",
        "event-description": "\u{e616}",
        "event-add": "\u{ef85}",
        "keyboard": "\u{e312}",
        "dnd-on": "\u{e7f8}",
        "dnd-off": "\u{e7f7}",
        "bat-0": "\u{f30d}",
        "bat-1": "\u{f30c}",
        "bat-2": "\u{f30b}",
        "bat-3": "\u{f30a}",
        "bat-4": "\u{f309}",
        "bat-5": "\u{f308}",
        "bat-6": "\u{f307}",
        "bat-7": "\u{f304}",
        "bat-charg-0": "\u{fff39}",
        "bat-charg-1": "\u{fff3e}",
        "bat-charg-2": "\u{fff3d}",
        "bat-charg-3": "\u{fff3c}",
        "bat-charg-4": "\u{fff3b}",
        "bat-charg-5": "\u{fff3a}",
        "volume-0": "\u{e710}",
        "volume-1": "\u{e04e}",
        "volume-2": "\u{e04d}",
        "volume-3": "\u{e050}",
        "volume-off": "\u{e04f}",
        "volume-mute": "\u{e710}",
        "media-prev": "\u{e045}",
        "media-play": "\u{e037}",
        "media-pause": "\u{e034}",
        "media-next": "\u{e044}",
        "bluetooth": "\u{e1a7}",
        "network": "\u{e63e}",
        "wifi-0": "\u{ebe4}",
        "wifi-1": "\u{ebd6}",
        "wifi-2": "\u{ebe1}",
        "wifi-3": "\u{e1d8}",
        "todo-add": "\u{f23a}",
    }

    readonly property var appIcons: {}

    FontLoader {
        id: shellFont
        source: Settings.iconFontPath
    }

    function init() {
    }

    function get(name: string): string {
        return root.shellIcons[name] ?? name;
    }
}
