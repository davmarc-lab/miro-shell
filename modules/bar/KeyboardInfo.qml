import QtQuick
import QtQuick.Layouts

import qs.common
import qs.widgets
import qs.services

RowLayout {
    id: root
    spacing: 3

    signal update

    MFontIcon {
        text: "keyboard"
    }

    MText {
        id: layout
        text: `${SLayout.current}`
        onTextChanged: root.update();

        Layout.alignment: Qt.AlignVCenter
        color: Theme.colorOnSurface
    }
}
