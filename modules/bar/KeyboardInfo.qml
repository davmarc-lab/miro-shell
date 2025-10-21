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

        spacing: 3

        MIcon {
            id: icon
            name: "keyboard"

            Layout.preferredWidth: height
            Layout.fillHeight: true
        }

        MText {
            id: layout
            text: `${SLayout.current}`

            Layout.alignment: Qt.AlignVCenter
            color: Theme.colorOnPrimary
        }
    }
}
