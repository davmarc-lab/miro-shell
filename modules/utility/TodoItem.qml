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
        text: root.text
        checked: root.checked

        onCheck: root.todoCheck()
        onUncheck: root.todoUncheck()
    }

    MIconClick {
        Layout.preferredWidth: check.indicator.width
        Layout.preferredHeight: check.indicator.height
        Layout.margins: Settings.itemMargin
        Layout.alignment: Qt.AlignVCenter

        name: "delete.svg"

        onIconClick: root.todoDelete()
    }
}
