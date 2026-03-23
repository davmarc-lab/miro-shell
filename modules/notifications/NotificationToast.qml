import Quickshell.Widgets

import QtQuick
import QtQuick.Layouts

import qs.common
import qs.widgets

MRectangle {
    id: root
    required property var notif

    border.color: Theme.colorOutline
    border.width: Settings.notifPopupBorderSize

    height: layout.height

    signal deadToast

    RowLayout {
        id: layout
        anchors {
            left: parent.left
            right: parent.right
        }
        anchors.verticalCenter: parent.verticalCenter

        IconImage {
            Layout.margins: Settings.itemMargin
            implicitSize: 32

            source: root.notif.image
        }

        ColumnLayout {
            Layout.fillWidth: true
            spacing: 0

            MTitle {
                id: appName
                Layout.fillWidth: true
                Layout.margins: Settings.itemMargin
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
                Layout.margins: Settings.itemMargin
                Layout.topMargin: 0

                color: Theme.colorOnSurface
                clip: true
                text: root.notif.body
            }
        }
    }

    Timer {
        id: alive
        running: true
        repeat: false

        interval: Settings.notifPopupTimer * 1000

        onTriggered: root.deadToast()
    }
}
