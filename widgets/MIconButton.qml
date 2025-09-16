import QtQuick

import qs.common

MRectangle {
    id: root
    color: mouse.containsMouse ? Theme.colorPrimaryHover : Theme.colorPrimary
    required property string iconName

    readonly property bool hovered: mouse.containsMouse
    readonly property bool pressed: mouse.pressed
    readonly property bool clicked: mouse.clicked
    property double iconMargins: Settings.iconButtonMargins

    signal iconClick

    MIcon {
        anchors.fill: parent
        anchors.margins: root.iconMargins
        name: root.iconName
    }

    MouseArea {
        id: mouse
        anchors.fill: parent
        hoverEnabled: true

        onClicked: {
            root.iconClick();
        }
    }
}
