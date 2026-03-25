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

    onOpenChanged: {
        Global.enableWPSelector = this.open;
    }

    MRectangle {
        Layout.alignment: Qt.AlignHCenter | Qt.AlignBottom
        Layout.preferredWidth: root.width * 0.4
        Layout.preferredHeight: root.height * 0.2

        color: Theme.colorSurface
        bottomLeftRadius: 0
        bottomRightRadius: this.bottomLeftRadius

        ListView {
            anchors.fill: parent
            anchors.margins: Settings.panelMargin
            orientation: ListView.Horizontal
            clip: true
            spacing: Settings.itemMargin

            model: SWallpaper.getDetected()

            delegate: MImageClick {
                id: wp
                required property int index
                required property string modelData

                imgIdx: index
                path: modelData

                fillMode: Image.PreserveAspectCrop

                onImageClicked: elem => {
                    SWallpaper.setCurrentByIndex(elem);
                }
            }
        }
    }
}
