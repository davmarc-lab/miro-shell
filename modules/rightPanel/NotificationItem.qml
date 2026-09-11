import QtQuick
import QtQuick.Layouts

import qs.common
import qs.services
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
            Layout.margins: Settings.notification.margin
            Layout.alignment: Qt.AlignTop | Qt.AlignHCenter
            implicitSize: 32

            name: root.notif.image
        }

        ColumnLayout {
            Layout.fillWidth: true
            spacing: 0

            RowLayout {
                Layout.fillWidth: true
                Layout.fillHeight: true
                Layout.margins: Settings.notification.margin

                MTitle {
                    id: appName
                    Layout.fillWidth: true
                    Layout.fillHeight: true
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

                MFontIcon {
                    icon: "cancel"
                    color: Theme.colorError
                    MouseArea {
                        anchors.fill: parent
                        onClicked: SNotification.clear(root.notif)
                    }
                }
            }

            MText {
                id: content
                Layout.fillWidth: true
                Layout.margins: Settings.notification.margin
                Layout.topMargin: 0

                color: Theme.colorOnSurface
                clip: true
                text: root.notif.body
            }
        }
    }
}
