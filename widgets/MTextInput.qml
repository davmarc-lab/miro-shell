import QtQuick
import QtQuick.Controls

import qs.common

TextField {
    id: root

    property string bgColor: Theme.colorSurface
    property bool isPassword: false

    echoMode: this.isPassword ? TextInput.Password : TextInput.Normal

    signal escaped

    color: Theme.colorOnSurface
    font.pointSize: Settings.fontSize

    leftPadding: Settings.itemMargin
    rightPadding: Settings.itemMargin

    verticalAlignment: TextInput.AlignVCenter

    background: MRectangle {
        color: root.bgColor
        radius: Settings.itemRadius / 2
    }

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
