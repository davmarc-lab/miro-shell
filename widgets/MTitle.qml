import QtQuick

import qs.common

MText {
    property bool subtitle: false

    font.pointSize: subtitle ? Settings.font.subTitleSize : Settings.font.titleSize
    font.preferShaping: true
    font.weight: Font.Bold
}
