import Quickshell.Io

import QtQuick
import QtQuick.Layouts

import qs.common
import qs.widgets
import qs.services

RowLayout {
    id: root
    spacing: 3

    property real percentage: SPower.battery.percentage

    MFontIcon {
        text: SPower.batteryIcon
    }

    MText {
        id: battery
        text: Math.round(SPower.battery.percentage * 100)

        Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
        color: Theme.colorOnSurface
    }

    Process {
        id: notif
        running: false
        command: ["notify-send", "Low Battery", "I will lose consciousness at 0%. Please do not panic."]
    }
}
