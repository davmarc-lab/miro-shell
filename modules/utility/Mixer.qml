import QtQuick
import QtQuick.Layouts

import qs.common
import qs.services
import qs.widgets

MRectangle {
    id: root
    anchors.fill: parent
    anchors.margins: Settings.itemMargin

    color: "green"

    ListView {
        model: SAudio.applicationsNode
        spacing: Settings.itemMargin
        anchors.fill: parent
        anchors.margins: Settings.itemMargin

        delegate: MixerItem {
            required property var modelData

            item: modelData
        }
    }
}
