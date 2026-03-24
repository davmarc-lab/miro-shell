import QtQuick
import QtQuick.Layouts

import qs.common
import qs.widgets
import qs.services

MWrapRectangle {
    id: root

    margin: 4

    color: Theme.colorPrimary

    RowLayout {
        anchors.fill: parent
        anchors.margins: 2

        spacing: 0

        MText {
            id: battery
            text: Math.round(SPower.battery.percentage * 100) + " %"

            Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
            color: Theme.colorOnPrimary
        }
    }
}
