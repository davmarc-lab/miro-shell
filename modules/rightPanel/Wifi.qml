import QtQuick

import qs.widgets
import qs.common
import qs.services

MRectangle {
    id: root

    color: Theme.colorSurface

    ListView {
        id: wifiList
        anchors.fill: parent
        anchors.margins: Settings.itemMargin

        clip: true
        spacing: 5

        model: SNetwork.getAvailableNetworks()
        delegate: WifiItem {
            required property var modelData

            wifi: modelData
        }
    }
}
