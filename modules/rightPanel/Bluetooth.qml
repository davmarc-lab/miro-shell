import QtQuick

import qs.common
import qs.services
import qs.widgets

MRectangle {
    color: Theme.colorSurface

    MText {
        anchors.centerIn: parent
        visible: SBluetooth.getDevices().count == 0
        text: "No Connected Device"
    }

    ListView {
        id: listView
        visible: SBluetooth.getDevices().count != 0
        anchors.fill: parent
        anchors.margins: Settings.panel.margin
        model: SBluetooth.getDevices()
        spacing: Settings.panel.margin
        clip: true

        delegate: BluetoothItem {
            id: delegate
            required property var modelData
            device: modelData
        }
    }
}
