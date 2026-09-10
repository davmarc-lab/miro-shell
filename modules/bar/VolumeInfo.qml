import QtQuick
import QtQuick.Layouts

import qs.common
import qs.widgets
import qs.services

RowLayout {
    spacing: 0
    Layout.fillHeight: true
    Layout.fillWidth: true

    MFontIcon {
        icon: SAudio.muted ? "\ue04f" : SAudio.volumeIcon
    }

    MText {
        id: vol
        text: SAudio.volume + " %"

        Layout.alignment: Qt.AlignVCenter
        color: Theme.colorOnSurface
    }
}
