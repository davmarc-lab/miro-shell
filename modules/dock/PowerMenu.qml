import QtQuick.Layouts
import QtQuick.Controls

import qs
import qs.common
import qs.widgets

MPopupPane {
    id: root

    sizex: root.width * 0.4
    sizey: root.height * 0.2
    align: Qt.AlignBottom | Qt.AlignHCenter

    onOpenChanged: {
        Global.enablePowerMenu = this.open;
    }

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: Settings.panelMargin
        spacing: Settings.panelMargin
    }
}
