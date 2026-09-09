import QtQuick

import qs.common

Text {
    id: root

    verticalAlignment: Text.AlignVCenter
    color: Theme.colorOnSurface

    property bool iconFilled: false
    property int iconWeight: 400
    property int iconGrad: 0
    property int iconSize: 24

    font.pixelSize: iconSize

    property alias icon: root.text
    font.family: Icons.shellThemeName
    font.variableAxes: ({
            "FILL": iconFilled,
            "wght": iconWeight,
            "GRAD": iconGrad,
            "opsz": iconSize
        })
}
