import QtQuick
import QtQuick.Layouts

import qs.common
import qs.widgets

MRectangle {
    id: root

    height: layout.height

    required property var notif

    color: Theme.colorSurface
    RowLayout {
        id: layout
        anchors {
            left: parent.left
            right: parent.right
        }
        anchors.verticalCenter: parent.verticalCenter

        MIcon {
            Layout.margins: Settings.item.margin
            implicitSize: 32

            name: root.notif.image
        }

        ColumnLayout {
            Layout.fillWidth: true
            spacing: 0

            MTitle {
                id: appName
                Layout.fillWidth: true
                Layout.margins: Settings.item.margin
                Layout.bottomMargin: 0
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
                Layout.margins: Settings.item.margin
                Layout.topMargin: 0

                color: Theme.colorOnSurface
                clip: true
                text: root.notif.body
            }
        }
    }
}
