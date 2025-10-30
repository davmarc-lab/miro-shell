import Quickshell
import Quickshell.Widgets
import Quickshell.Services.SystemTray

import QtQuick
import QtQuick.Layouts

import qs.common
import qs.widgets
import qs.services

MWrapRectangle {
    id: root

    margin: 4

    RowLayout {
        anchors.fill: parent
        anchors.margins: 2

        spacing: 2

        Repeater {
            model: SSystemTray.getItems()

            delegate: MWrapRectangle {
                id: base
                required property SystemTrayItem modelData

                margin: 10

                IconImage {
                    source: trimUrl(base.modelData.icon)

                    anchors.fill: parent

                    function trimUrl(source: string): string {
                        var escape = "?path=";
                        var index = source.indexOf(escape);
                        if (index !== -1) {
                            var start = source.indexOf("icon/") + 5;
                            if (start === -1)
                                return "";

                            var dir = base.modelData.icon.substr(index + escape.length) + "/";
                            var name = source.substr(start, index - start);
                            return Qt.resolvedUrl(dir + name);
                        }

                        return source;
                    }
                }
            }
        }
    }
}
