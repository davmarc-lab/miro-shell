import QtQuick.Layouts

import qs.common
import qs.widgets

MThemeIconButton {
    id: root

    required property string name

    Layout.preferredWidth: Layout.preferredHeight
    Layout.preferredHeight: Settings.rightPanel.iconSize
    color: {
        if (this.pressed)
            return Theme.colorSecondary;

        return this.hovered ? Theme.colorPrimaryHover : Theme.colorPrimary;
    }

    iconName: root.name
}
