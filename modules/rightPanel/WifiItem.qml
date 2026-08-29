import QtQuick
import QtQuick.Layouts

import qs.common
import qs.services
import qs.widgets

Item {
    id: root

    required property var wifi
    property bool isExpanded: false

    readonly property int itemMargin: Settings.item.margin
    readonly property int contentPadding: 14
    readonly property int spacingMedium: 10
    readonly property color colorConnected: "#2ecc71"
    readonly property color colorAccent: "#3498db"
    readonly property color colorDivider: "#3a3a3a"

    readonly property int iconSize: 22

    width: ListView.view ? ListView.view.width : implicitWidth

    // height now derives from actual content, not magic numbers
    implicitHeight: background.implicitHeight
    height: implicitHeight

    Behavior on height {
        NumberAnimation {
            duration: 220
            easing.type: Easing.OutCubic
        }
    }

    MRectangle {
        id: background
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.margins: root.itemMargin / 2
        radius: 10
        color: root.wifi.connected ? Qt.rgba(root.colorAccent.r, root.colorAccent.g, root.colorAccent.b, 0.08) : "transparent"
        border.color: root.wifi.connected ? root.colorAccent : Theme.colorOutline
        border.width: root.wifi.connected ? 1.5 : 1

        implicitHeight: mainColumn.implicitHeight + root.contentPadding * 2

        Behavior on color {
            ColorAnimation {
                duration: 150
            }
        }

        Behavior on border.color {
            ColorAnimation {
                duration: 150
            }
        }

        MouseArea {
            anchors.fill: parent
            onClicked: root.isExpanded = !root.isExpanded
        }

        ColumnLayout {
            id: mainColumn
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.margins: root.contentPadding
            spacing: 0

            RowLayout {
                Layout.fillWidth: true
                spacing: root.spacingMedium

                MText {
                    text: root.wifi.signalStrength
                    font.pointSize: Settings.font.size + 4
                    Layout.alignment: Qt.AlignVCenter
                }

                ColumnLayout {
                    Layout.fillWidth: true
                    spacing: 4

                    MText {
                        text: root.wifi.name
                        font.pointSize: Settings.font.size
                        font.weight: Font.DemiBold
                        elide: Text.ElideRight
                        Layout.fillWidth: true
                    }

                    MText {
                        visible: root.wifi.connected
                        text: "Connected"
                        color: root.colorConnected
                        font.pointSize: Settings.font.size - 2
                    }
                }

                MRectangle {
                    Layout.preferredWidth: root.iconSize
                    Layout.preferredHeight: width
                    Layout.alignment: Qt.AlignVCenter
                    color: Theme.colorPrimary

                    MThemeIcon {
                        anchors.fill: parent
                        anchors.margins: Settings.button.iconMargin
                        name: root.isExpanded ? "down-arrow" : "right-arrow"
                    }
                }
            }

            ColumnLayout {
                id: expandedArea
                Layout.fillWidth: true
                Layout.topMargin: root.isExpanded ? root.spacingMedium : 0
                spacing: root.spacingMedium
                clip: true

                // collapse content height smoothly instead of using opacity+fixed extra
                Layout.preferredHeight: root.isExpanded ? implicitHeight : 0
                Behavior on Layout.preferredHeight {
                    NumberAnimation {
                        duration: 200
                        easing.type: Easing.OutCubic
                    }
                }
                opacity: root.isExpanded ? 1 : 0
                Behavior on opacity {
                    NumberAnimation {
                        duration: 160
                    }
                }

                Rectangle {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 1
                    color: root.colorDivider
                }

                RowLayout {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 34
                    spacing: root.spacingMedium

                    MButton {
                        visible: !root.wifi.connected
                        text: "Connect"
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        onClicked: SNetwork.connect(root.wifi)
                    }
                    MButton {
                        visible: root.wifi.connected
                        text: "Disconnect"
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        onClicked: SNetwork.disconnect(root.wifi)
                    }
                    MButton {
                        visible: root.wifi.connected
                        text: "Forget"
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        onClicked: SNetwork.forget(root.wifi)
                    }
                }
            }
        }
    }
}
