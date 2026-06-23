import QtQuick

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
        id: wifiList

        visible: this.model.length != 0

        anchors.fill: parent
        anchors.margins: Settings.item.margin

        clip: true
        spacing: 5

        model: SNetwork.getAvailableNetworks()
        delegate: WifiItem {
            required property var modelData

            wifi: modelData
        }
    }
}
