pragma ComponentBehavior: Bound

import Quickshell
import Quickshell.Widgets
import Quickshell.Services.SystemTray

import QtQuick

import qs.common
import qs.widgets
import qs.services

Item {
    id: root

    implicitWidth: Settings.bar.align.isHorizontal ? view.contentWidth : root.width
    implicitHeight: Settings.bar.align.isHorizontal ? root.height : view.contentHeight

    ListView {
        id: view

        anchors.fill: parent

        anchors {
            topMargin: Settings.bar.align.isHorizontal ? 0 : Settings.item.margin
            bottomMargin: topMargin
            leftMargin: Settings.bar.align.isHorizontal ? Settings.item.margin : 0
            rightMargin: leftMargin
        }

        // anchors.margins: Settings.item.margin
        // anchors.topMargin: 5
        // anchors.bottomMargin: 5

        spacing: 10

        clip: true
        orientation: Settings.bar.align.isHorizontal ? ListView.Horizontal : ListView.Vertical
        width: Settings.bar.align.isHorizontal ? root.implicitWidth : 10
        height: Settings.bar.align.isHorizontal ? 10 : root.implicitHeight

        model: SSystemTray.getItems()

        delegate: Item {
            id: item
            width: icon.implicitSize
            height: root.height - Settings.item.margin * 1.4

            anchors.verticalCenter: parent.verticalCenter

            required property SystemTrayItem modelData

            MIcon {
                id: icon
                anchors.fill: parent
                implicitSize: parent.height

                visible: item.modelData.icon != ""

                name: trimUrl(item.modelData.icon)

                function trimUrl(source: string): string {
                    var escape = "?path=";
                    var index = source.indexOf(escape);
                    if (index !== -1) {
                        const start = source.indexOf("icon/") + 5;
                        if (start === -1)
                            return "";

                        const dir = item.modelData.icon.substr(index + escape.length) + "/";
                        const name = source.substr(start, index - start);
                        return Qt.resolvedUrl(dir + name);
                    }

                    return source;
                }
            }

            // QsMenuAnchor {
            //     id: menuOpener
            //     menu: item.modelData.menu

            //     anchor {
            //         item: item
            //         edges: Edges.Left | Edges.Bottom
            //         margins.top: Settings.panel.margin
            //     }
            // }

            // MouseArea {
            //     anchors.fill: icon

            //     onClicked: {
            //         menuOpener.open();
            //     }
            // }

        }
    }
}
