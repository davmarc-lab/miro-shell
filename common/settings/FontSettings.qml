import Quickshell.Io

import QtQuick

JsonObject {
    id: root

    property string name: ""

    property int iconSize: 24 * Screen.devicePixelRatio
    property bool iconFill: true

    property int size: 16 * Screen.devicePixelRatio
    property int titleSize: 20 * Screen.devicePixelRatio
    property int subTitleSize: 18 * Screen.devicePixelRatio
}
