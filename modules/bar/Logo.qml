import QtQuick
import QtQuick.Layouts

import qs.common
import qs.widgets

import qs

MRectangle {
    id: root
    Layout.preferredWidth: icon.implicitSize
    Layout.fillHeight: true

    color: Theme.colorSurfaceVariant

    MThemeIcon {
        id: icon
        anchors.fill: parent
        anchors.margins: Settings.item.margin * .8

        implicitSize: Settings.bar.height

        name: "winslop"
    }

    MouseArea {
        id: mouse
        anchors.fill: parent

        onClicked: {
            Global.enableUtility = true;
        }
    }
}
