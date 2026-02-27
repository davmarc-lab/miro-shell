import QtQuick.Controls

import qs.common

TextField {
    id: root

    color: Theme.colorOnSurface
    font.pointSize: Settings.fontSize

    background: MRectangle {
        color: Theme.colorSurface
    }
}
