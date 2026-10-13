import QtQuick
import QtQuick.Layouts

import qs.common
import qs.widgets
import qs.services

RowLayout {
    id: root
    spacing: 0
    Layout.fillHeight: true
    Layout.fillWidth: true

    signal update

    MFontIcon {
        icon: SAudio.muted ? "volume-off" : SAudio.volumeIcon
    }

    MText {
        id: vol
        text: SAudio.volume + " %"

        Layout.alignment: Qt.AlignVCenter
        color: Theme.colorOnSurface
        onTextChanged: root.update()
    }
}
