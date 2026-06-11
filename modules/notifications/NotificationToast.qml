import QtQuick
import QtQuick.Layouts

import qs.common
import qs.widgets

MRectangle {
    id: root
    required property var notif

    border.color: Theme.colorOutline
    border.width: Settings.notification.popup.borderSize

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
            Layout.margins: Settings.item.margin
            Layout.alignment: Qt.AlignTop | Qt.AlignHCenter
            implicitSize: 32

            name: root.notif?.image ?? ""
        }

        ColumnLayout {
            Layout.fillWidth: true
            Layout.fillHeight: true
            spacing: 0

            RowLayout {
                Layout.fillWidth: true
                Layout.fillHeight: true
                Layout.topMargin: Settings.notification.margin
                Layout.rightMargin: Layout.topMargin
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

                MThemeIconClick {
                    Layout.preferredWidth: parent.height * 0.7
                    Layout.preferredHeight: width
                    Layout.alignment: Qt.AlignVCenter

                    name: "delete.svg"

                    onIconClick: alive.triggered()
                }
            }

            MText {
                id: content
                Layout.fillWidth: true
                Layout.rightMargin: Settings.item.margin
                Layout.bottomMargin: Settings.item.margin
                wrapMode: Text.Wrap

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

        interval: Settings.notification.popup.timer * 1000

        onTriggered: root.deadToast()
    }
}
