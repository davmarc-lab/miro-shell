pragma Singleton

import Quickshell

import QtQuick

Singleton {
    id: root

    property var precision: SystemClock.Minutes

    readonly property string time: {
        Qt.formatDateTime(clock.date, "hh:mm");
    }

    readonly property string hour: Qt.formatDateTime(clock.date, "hh");
    readonly property string minute: Qt.formatDateTime(clock.date, "mm");

    property string dayFormat: "dd-MM-yyyy, ddd"
    readonly property string date: {
        Qt.formatDateTime(clock.date, dayFormat);
    }

    SystemClock {
        id: clock
        precision: root.precision
    }
}
