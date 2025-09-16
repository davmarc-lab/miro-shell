pragma Singleton

import Quickshell

Singleton {
    id: root

    property var precision: SystemClock.Minutes

    readonly property string time: {
        Qt.formatDateTime(clock.date, "hh:mm");
    }

    property string dayFormat: "dd-MM-yyyy, ddd"
    readonly property string date: {
        Qt.formatDateTime(clock.date, dayFormat);
    }

    SystemClock {
        id: clock
        precision: root.precision
    }
}
