import QtQuick

import qs.common
import qs.services

Item {
    id: root
    anchors.fill: parent

    ListView {
        model: SAudio.applicationsNode
        spacing: Settings.item.margin
        anchors.fill: parent
        anchors.margins: Settings.item.margin
        clip: true

        delegate: MixerItem {
            required property var modelData
            width: ListView.view.width
            node: modelData
        }
    }
}
