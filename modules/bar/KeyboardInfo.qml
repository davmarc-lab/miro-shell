import QtQuick
import QtQuick.Layouts

import qs.common
import qs.widgets
import qs.services

RowLayout {
    spacing: 3

    MThemeIcon {
        id: icon
        name: "keyboard"

        Layout.preferredWidth: height
        Layout.fillHeight: true
    }

    MText {
        id: layout
        text: `${SLayout.current}`

        Layout.alignment: Qt.AlignVCenter
        color: Theme.colorOnSurface
    }
}
