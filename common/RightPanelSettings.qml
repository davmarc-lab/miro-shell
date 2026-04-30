import Quickshell.Io

import qs.common

JsonObject {
    id: root

    property int iconSize: Settings.bar.align.isVertical ? Settings.bar.width : Settings.bar.height
}
