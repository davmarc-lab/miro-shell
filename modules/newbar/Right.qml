import Quickshell

import QtQuick
import QtQuick.Layouts

import qs
import qs.common
import qs.services
import qs.types
import qs.widgets
import qs.modules.bar

Scope {
    Variants {
        model: Quickshell.screens
        HidePanel {
            id: root
            anchors {
                top: true
                right: true
            }
            decorationTop: true
            dirTransition: Transitions.Direction.Bottom

            implicitHeight: Settings.bar.height + Settings.item.margin
            implicitWidth: Screen.width * 0.15 + Settings.item.margin * 2

            topLeftRadius: 0
            topRightRadius: 0
            bottomRightRadius: 0

            MRectangle {
                id: base
                anchors.fill: parent
                topLeftRadius: 0
                topRightRadius: topLeftRadius
                bottomRightRadius: 0

                RowLayout {
                    anchors.fill: parent

                    Item {
                        Layout.fillHeight: true
                        Layout.preferredWidth: key.implicitWidth + Settings.item.margin * 2

                        KeyboardInfo {
                            id: key
                            anchors.centerIn: parent
                        }
                    }

                    Item {
                        Layout.fillHeight: true
                        Layout.preferredWidth: vol.implicitWidth + Settings.item.margin

                        VolumeInfo {
                            id: vol
                            anchors.centerIn: parent
                        }

                        MouseArea {
                            id: mouse
                            anchors.fill: parent
                            onClicked: Global.enableVolumeSliderPopup = !Global.enableVolumeSliderPopup
                        }
                    }

                    Item {
                        visible: SPower.isBattery()

                        Layout.fillHeight: true
                        Layout.preferredWidth: bat.implicitWidth + Settings.item.margin * 2

                        BatteryInfo {
                            id: bat
                            anchors.centerIn: parent
                        }
                    }

                    Loader {
                        active: SSystemTray.itemsCount
                        visible: this.active

                        Layout.fillHeight: true
                        Layout.fillWidth: true
                        Layout.margins: Settings.item.margin / 2

                        sourceComponent: SystemTray {
                            id: sys
                            anchors.fill: parent
                        }
                    }
                }
            }
        }
    }
}
