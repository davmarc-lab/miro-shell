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

        MIcon {
            Layout.margins: Settings.itemMargin
            implicitSize: 32

            name: root.notif?.image ?? ""
        }

        ColumnLayout {
            Layout.fillWidth: true
            spacing: 0

            RowLayout {
                Layout.fillWidth: true
                Layout.margins: Settings.itemMargin
                Layout.bottomMargin: 0

                MTitle {
                    id: appName
                    Layout.fillWidth: true
                    Layout.alignment: Qt.AlignTop | Qt.AlignLeft
                    subtitle: true

                    color: Theme.colorOnSurface
                    font.weight: Font.Bold
                    text: {
                        if (root.notif == null)
                            return "";
                        if (root.notif.summary.length)
                            return root.notif.summary;
                        return root.notif.appName;
                    }
                }

                MRButton {
                    Layout.alignment: Qt.AlignRight
                    text: "X"
                    Layout.preferredWidth: this.height

                    // trigger timer callback
                    onClicked: alive.triggered()
                }
            }

            MText {
                id: content
                Layout.fillWidth: true
                Layout.margins: Settings.itemMargin
                Layout.topMargin: 0

                color: Theme.colorOnSurface
                clip: true
                text: root.notif?.body ?? ""
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
