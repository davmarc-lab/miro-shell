import QtQuick

import qs.common

MText {
    property bool subtitle: false

    font.pointSize: subtitle ? Settings.fontSubTitle : Settings.fontTitle
    font.preferShaping: true
    font.weight: Font.Medium
}
