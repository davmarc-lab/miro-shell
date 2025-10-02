import QtQuick.Layouts

import qs.common
import qs.widgets

MRectangle {
    id: root

    Layout.fillWidth: true
    Layout.fillHeight: true

    color: Theme.colorPrimary

    RowLayout {
        anchors.fill: parent
        anchors.margins: 2

        MIcon {
            id: icon
            name: "sound"

            Layout.fillWidth: true
            Layout.fillHeight: true
        }
    }
}
