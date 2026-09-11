import QtQuick
import QtQuick.Controls

import qs.common

TextField {
    id: root

    property string bgColor: Theme.colorSurface
    property string borderColor: Theme.colorOutline
    property bool isPassword: false

    echoMode: this.isPassword ? TextInput.Password : TextInput.Normal

    signal escaped

    color: Theme.colorOnSurface
    font.pixelSize: Settings.font.size

    leftPadding: Settings.item.margin
    rightPadding: Settings.item.margin

    background: MRectangle {
        color: root.bgColor
        radius: Settings.item.radius / 2
        border.color: root.borderColor
    }

    placeholderTextColor: Theme.colorOnSurface

    // lose input focus
    onEscaped: this.focus = false

    Keys.onEscapePressed: this.escaped()
    Keys.onReturnPressed: {
        this.focus = false;
        this.accepted();
    }
    Keys.onEnterPressed: {
        this.focus = false;
        this.accepted();
    }
}
