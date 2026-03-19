import QtQuick
import QtQuick.Layouts

import qs.common
import qs.widgets

MRectangle {
    id: root
    required property var wifi

    property bool connect: wifi.inUse !== "*"

    width: ListView.view.width
    height: layout.height + 2 * Settings.itemMargin

    RowLayout {
        id: layout
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
            text: connect ? "Connect" : "Disconnect"

            onClicked: {
                console.log(connect ? "Connect" : "Disconnect")
            }
        }
    }

    function isFocused(): bool {
    }
}
