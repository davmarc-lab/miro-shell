import QtQuick
import QtQuick.Layouts

import qs.common
import qs.widgets
import qs.services

RowLayout {
    spacing: 1

    MThemeIcon {
        id: icon
        name: "sound"

        Layout.preferredWidth: height
        Layout.fillHeight: true
    }

    MText {
        id: vol
        text: SAudio.muted ? "M " : `${SAudio.volume} %`

        Layout.alignment: Qt.AlignVCenter
        color: Theme.colorOnSurface
    }
}
