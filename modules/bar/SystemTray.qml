pragma ComponentBehavior: Bound

import Quickshell
import Quickshell.Widgets
import Quickshell.Services.SystemTray

import QtQuick

import qs.common
import qs.widgets
import qs.services

ListView {
    id: systrayList
    anchors.fill: parent
    anchors.verticalCenter: parent.verticalCenter
    anchors.margins: Settings.itemMargin
    spacing: Settings.itemMargin

    clip: true
    orientation: ListView.Horizontal

    model: SSystemTray.getItems()

    delegate: Item {
        id: item
        width: ListView.view.height
        height: parent.height
        anchors.verticalCenter: parent.verticalCenter

        required property SystemTrayItem modelData

        QsMenuAnchor {
            id: menuOpener
            menu: item.modelData.menu

            anchor {
                item: item
                edges: Edges.Left | Edges.Bottom
                margins.top: Settings.panelMargin
            }
        }

        MouseArea {
            anchors.fill: icon

            onClicked: {
                menuOpener.open();
            }
        }

        MIcon {
            id: icon
            anchors.centerIn: parent
            implicitSize: 24

            visible: item.modelData.icon != ""

            name: trimUrl(item.modelData.icon)

            function trimUrl(source: string): string {
                var escape = "?path=";
                var index = source.indexOf(escape);
                if (index !== -1) {
                    var start = source.indexOf("icon/") + 5;
                    if (start === -1)
                        return "";

                    var dir = item.modelData.icon.substr(index + escape.length) + "/";
                    var name = source.substr(start, index - start);
                    return Qt.resolvedUrl(dir + name);
                }

                return source;
            }
        }
    }
}
