import QtQuick
import QtQuick.Layouts

import qs.common
import qs.widgets
import qs.services

RowLayout {
    spacing: 3

    MThemeIcon {
        id: icon
        name: "battery"

        Layout.preferredWidth: height
        Layout.fillHeight: true
    }

    MText {
        id: battery
        text: Math.round(SPower.battery.percentage * 100)

        Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
        color: Theme.colorOnSurface
    }
}
