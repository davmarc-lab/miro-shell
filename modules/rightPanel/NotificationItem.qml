import QtQuick
import QtQuick.Layouts

import qs.common
import qs.widgets

MWrapRectangle {
    id: root

    required property var notif

    color: Theme.colorSurface

    Item {
        anchors.fill: parent
        anchors.margins: Settings.itemMargin

        ColumnLayout {
            anchors.fill: parent

            MTitle {
                id: appName
                Layout.fillWidth: true
                subtitle: true

                color: Theme.colorOnSurface
                font.weight: Font.Bold
                text: {
                    if (root.notif.summary.length)
                        return root.notif.summary;
                    return root.notif.appName;
                }
            }

            MText {
                id: content
                Layout.fillWidth: true

                color: Theme.colorOnSurface
                text: root.notif.body
            }

            MFillLayout {}
        }
    }
}
