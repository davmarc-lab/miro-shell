import QtQuick.Controls

import qs.common

TextField {
    id: root

    property string bgColor: Theme.colorSurface

    color: Theme.colorOnSurface
    font.pointSize: Settings.fontSize

    background: MRectangle {
        color: root.bgColor
    }
}
