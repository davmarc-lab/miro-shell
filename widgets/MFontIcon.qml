import QtQuick

import qs.common

Text {
    id: root
    width: Settings.font.size
    height: width

    topPadding: height * Icons.shellTopSpacingFactor
    horizontalAlignment: Text.AlignHCenter
    verticalAlignment: Text.AlignVCenter

    color: Theme.colorOnSurface
    renderType: Text.NativeRendering

    property alias icon: root.text
    property bool iconFilled: Settings.font.iconFill
    property int iconWeight: 400
    property int iconGrad: 0
    property int iconSize: 24

    font {
        family: Icons.shellThemeName
        pixelSize: Settings.font.iconSize

        variableAxes: ({
                "FILL": iconFilled,
                "wght": iconWeight,
                "GRAD": iconGrad,
                "opsz": iconSize
            })
    }
}
