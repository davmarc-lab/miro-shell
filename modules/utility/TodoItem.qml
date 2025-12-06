import QtQuick
import QtQuick.Layouts

import qs.common
import qs.widgets

RowLayout {
    id: root
    property string text: ""

    MCheckBox {
        id: check
        Layout.fillWidth: true
        text: root.text
    }

    MIconClick {
        Layout.preferredWidth: check.indicator.width
        Layout.preferredHeight: check.indicator.height
        Layout.margins: Settings.itemMargin
        Layout.alignment: Qt.AlignVCenter

        name: "delete.svg"
    }
}
