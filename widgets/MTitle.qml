import QtQuick

import qs.common

MText {
    property bool subtitle: false

    font.pixelSize: subtitle ? Settings.font.subTitleSize : Settings.font.titleSize
    font.preferShaping: true
    font.weight: Font.Bold
}
