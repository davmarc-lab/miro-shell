pragma ComponentBehavior: Bound
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import qs
import qs.common
import qs.widgets
import qs.services

MPopupPane {
    id: root

    sizex: root.width * 0.4
    sizey: root.height * 0.2
    align: Qt.AlignBottom | Qt.AlignHCenter

    onOpenChanged: {
        Global.enableWPSelector = this.open;
    }

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: Settings.panelMargin
        spacing: Settings.panelMargin

        MRectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: Theme.colorSurface

            ScrollView {
                id: scroll
                anchors.fill: parent

                RowLayout {
                    anchors.fill: parent

                    Repeater {
                        model: SWallpaper.getDetected()

                        delegate: MImageClick {
                            id: wp
                            required property int index
                            required property string modelData

                            imgIdx: index
                            path: modelData

                            // no click detected
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
