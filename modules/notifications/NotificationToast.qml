import QtQuick
import QtQuick.Layouts

import qs.common
import qs.services
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
            Layout.margins: Settings.notification.margin
            Layout.alignment: Qt.AlignTop | Qt.AlignHCenter
            Layout.preferredWidth: 32
            Layout.preferredHeight: width

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

                MFontIcon {
                    id: deleteIcon
                    icon: "cancel"
                    color: Theme.colorError
                    HoverHandler {
                        id: iconHover
                    }
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

    containmentMask: deleteIcon

    MouseArea {
        anchors.fill: parent
        propagateComposedEvents: true
        onClicked: {
            if (iconHover.hovered) {
                // dismiss notif
                SNotification.clear(root.notif);
                return;
            }
        }

        // stop notification timer
        onPressed: {
            if (alive.running)
                alive.running = false;
        }

        drag {
            target: root
            axis: Drag.XAxis
        }

        onReleased: {
            const initialPos = 0;
            const offset = root.width / 2;
            if (drag.target.x - initialPos >= offset) {
                alive.triggered();
            } else {
                drag.target.x = initialPos;
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
