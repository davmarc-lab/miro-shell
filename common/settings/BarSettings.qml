import Quickshell.Io

import qs.types

JsonObject {
    id: root

    property int height: 30
    property int width: 30

    property bool transparent: true

    property Margins margins: Margins {}

    property BarSet align: BarSet {}

    property int size: align.isHorizontal ? (height + margins.top + margins.bottom) : (width + margins.left + margins.right)
}
