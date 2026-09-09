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

    onPercentageChanged: {
        if (percentage <= 0.2) {
            // send notification
            // console.log(percentage);
            // notif.running = true;
        }
    }

    MThemeIcon {
        id: icon
        name: "battery"

        Layout.preferredWidth: height
        Layout.fillHeight: true
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
