import Quickshell
import Quickshell.Wayland

import QtQuick
import QtQuick.Layouts

import qs
import qs.common
import qs.widgets

Scope {
    Variants {
        model: Quickshell.screens

        MPanelWindow {
            id: root
            WlrLayershell.keyboardFocus: WlrKeyboardFocus.None

            required property var modelData
            screen: modelData

            color: "transparent"

            anchors {
                top: Settings.bar.align.isTop || Settings.bar.align.isVertical
                left: Settings.bar.align.isLeft || Settings.bar.align.isHorizontal
                right: Settings.bar.align.isRight || Settings.bar.align.isHorizontal
                bottom: Settings.bar.align.isBottom || Settings.bar.align.isVertical
            }

            width: Settings.bar.align.isHorizontal ? screen.width : Settings.bar.width
            height: Settings.bar.align.isHorizontal ? Settings.bar.height : screen.height

            MRectangle {
                id: base
                anchors.fill: parent
                anchors.margins: Settings.item.margin / 4

                color: "red"

                RowLayout {
                    id: leftSection
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.left: parent.left
                    anchors.right: middleSection.left

                    Logo {}

                    Workspaces {}

                    MediaPlayer {}

                    MFillLayout {
                        dy: false
                    }
                }

                RowLayout {
                    id: middleSection

                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.horizontalCenter: parent.horizontalCenter

                    Clock {}
                }

                RowLayout {
                    id: rightSection
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.left: middleSection.right
                    anchors.right: parent.right

                    Layout.alignment: Qt.AlignVCenter | Qt.AlignRight
                    Layout.fillWidth: true
                    Layout.fillHeight: true

                    MFillLayout {}

                    MWrapRectangle {
                        Layout.fillHeight: true

                        RowLayout {
                            anchors.fill: parent
                            anchors.leftMargin: 6

                            KeyboardInfo {}

                            VolumeInfo {}

                            BatteryInfo {}

                            MFillLayout {}
                        }
                    }

                    MRectangle {
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        Layout.maximumWidth: 150

                        SystemTray {
                            anchors.fill: parent
                        }
                    }

                    MThemeIconButton {
                        Layout.fillHeight: true
                        Layout.preferredWidth: this.height
                        iconName: Global.enableRightPanel ? "down-arrow.svg" : "right-arrow.svg"

                        color: Theme.colorSurfaceVariant
                        onIconClick: {
                            Global.enableRightPanel = true;
                        }
                    }
                }
            }
        }
    }
}
