import QtQuick

import qs.common

MRectangle {
    id: root

    required property string iconName

    readonly property bool hovered: mouse.containsMouse
    readonly property bool pressed: mouse.pressed
    readonly property bool clicked: mouse.clicked

    property double iconMargins: Settings.button.iconMargin

    signal iconClick

    color: {
        if (this.pressed)
            return Theme.colorSecondary;

        return this.hovered ? Theme.colorPrimaryHover : Theme.colorPrimary;
    }

    MThemeIcon {
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
