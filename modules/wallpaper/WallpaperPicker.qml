pragma ComponentBehavior: Bound

import Quickshell

import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import qs
import qs.common
import qs.widgets
import qs.services

MPopup {
    id: root

    // open: Global.enableWPSelector
    onOpenChanged: {
        Global.enableWPSelector = this.open;
    }

    MRectangle {
        Layout.alignment: Qt.AlignHCenter | Qt.AlignBottom
        Layout.preferredWidth: root.width * 0.4
        Layout.preferredHeight: root.height * 0.2

        color: Theme.colorSurface

        ColumnLayout {
            anchors.fill: parent
            anchors.margins: Settings.panelMargin
            spacing: Settings.panelMargin

            MRectangle {
                id: contentPanel
                Layout.fillWidth: true
                Layout.fillHeight: true
                color: Theme.colorSurface

                ScrollView {
                    id: scroll
                    anchors.fill: parent
                    ScrollBar.vertical.policy: ScrollBar.AlwaysOff

                    RowLayout {
                        anchors.fill: parent
                        Layout.margins: 0

                        Repeater {
                            model: SWallpaper.getDetected()

                            delegate: MImageClick {
                                id: wp
                                required property int index
                                required property string modelData

                                imgIdx: index
                                path: modelData

                                fillMode: Image.PreserveAspectCrop

                                // don't know why with this line vertical scroll is fixed
                                sizey: scroll.availableHeight + 1
                                // Layout.fillWidth: true
                                // Layout.fillHeight: true

                                onImageClicked: elem => {
                                    SWallpaper.setCurrentByIndex(elem);
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
