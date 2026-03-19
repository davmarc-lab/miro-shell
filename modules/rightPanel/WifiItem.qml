import QtQuick
import QtQuick.Layouts

import qs.common
import qs.widgets

MRectangle {
    id: root
    required property var wifi

    width: ListView.view.width
    height: childrenRect.height * 2

    RowLayout {
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        anchors.left: parent.left
        anchors.margins: Settings.itemMargin

        MText {
            text: root.wifi.signal
        }

        MText {
            text: root.wifi.ssid
        }

        MFillLayout {}

        MButton {
            id: connect
            Layout.alignment: Qt.AlignRight
            text: root.wifi.inUse !== "*" ? "Connect" : "Disconnect"
        }
    }

    function isFocused(): bool {
    }
}
