import QtQuick
import QtQuick.Layouts

import qs.services
import qs.widgets

Item {
    id: root

    anchors.fill: parent

    MSlider {
        anchors.fill: parent

        start: 0
        end: 1

        value: SAudio.rawVolume

        onValueChanged: SAudio.setVolume(value)
    }
}
