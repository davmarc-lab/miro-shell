import QtQuick
import QtQuick.Layouts

import qs.common
import qs.services
import qs.widgets

ExpandArea {
    MText {
        anchors.centerIn: parent
        visible: SNetwork.getAvailableNetworks().length == 0
        text: "No WiFi Available"
    }

    ListView {
        id: listView
        anchors.fill: parent
        anchors.margins: Settings.panel.margin
        model: SNetwork.getAvailableNetworks()
        spacing: Settings.panel.margin
        clip: true

        delegate: WifiItem {
            id: delegate
            required property var modelData
            wifi: modelData
        }
    }
}
