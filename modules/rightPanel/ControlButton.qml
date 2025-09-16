import QtQuick.Layouts

import qs.common
import qs.widgets

MIconButton {
    id: root

    required property string name

    Layout.fillWidth: true
    Layout.preferredHeight: Settings.rightIconsSize
    color: {
        if (this.pressed)
            return Theme.colorSecondary;

        return this.hovered ? Theme.colorPrimaryHover : Theme.colorPrimary;
    }

    iconName: root.name
}
