import QtQuick
import QtQuick.Layouts

import qs.common
import qs.widgets

RowLayout {
    id: root
    property string text: ""
    property bool checked: false

    signal todoCheck
    signal todoUncheck

    signal todoDelete

    MCheckBox {
        id: check
        Layout.fillWidth: true
        Layout.alignment: Qt.AlignVCenter
        text: root.text
        checked: root.checked

        onCheck: root.todoCheck()
        onUncheck: root.todoUncheck()
    }

    MFontIcon {
        icon: "cancel"
        color: Theme.colorError

        MouseArea {
            anchors.fill: parent

            onClicked: root.todoDelete()
        }
    }
}
