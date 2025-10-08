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

        MIcon {
            id: icon
            name: "sound"

            Layout.preferredWidth: height
            Layout.fillHeight: true
        }

        MText {
            id: vol
            text: `${SAudio.getVolume()} %`

            Layout.alignment: Qt.AlignVCenter
            color: Theme.colorOnPrimary
        }
    }
}
