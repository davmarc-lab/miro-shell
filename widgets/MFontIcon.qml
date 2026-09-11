import QtQuick

import qs.common

Text {
    id: root
    property int iconSize: Settings.font.iconSize
    property bool unicode: true


    topPadding: height * Icons.topSpacingFactor
    horizontalAlignment: Text.AlignHCenter
    verticalAlignment: Text.AlignVCenter

    color: Theme.colorOnSurface
    renderType: Text.NativeRendering

    property string icon: ""
    property bool iconFilled: Settings.font.iconFill
    property int iconWeight: 400
    property int iconGrad: 0
    property int iconOpticalSize: 24

    text: unicode && icon != "" ? Icons.get(icon) : icon

    font {
        family: Icons.fontName
        pixelSize: root.iconSize

        variableAxes: ({
                "FILL": iconFilled,
                "wght": iconWeight,
                "GRAD": iconGrad,
                "opsz": iconOpticalSize
            })
    }
}
