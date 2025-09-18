import QtQuick
import QtQuick.Layouts

import Quickshell

import qs.widgets
import qs.services
import qs.common

MPanelWindow {
    id: root
    visible: false

    anchors {
        top: true
        right: true
    }

    margins {
        right: 10
    }

    implicitWidth: 100
    implicitHeight: 100
    color: Theme.colorSurface

    ColumnLayout {
        anchors.fill: parent
        anchors.rightMargin: Settings.notifItemBorder
        anchors.leftMargin: Settings.notifItemBorder

        MRButton {
            id: clear

            Layout.alignment: Qt.AlignRight

            text: "Clear"

            onClicked: () => {
                // it works
                SNotification.clearAll();
            }
        }

        ListView {
            id: notifs
            Layout.fillWidth: true
            Layout.fillHeight: true
            model: ScriptModel {
                id: notifModel
                values: [...SNotification.notifications]
            }

            spacing: 10

            delegate: Rectangle {
                id: notif
                required property SNotification.Notif modelData

                color: Theme.colorSurfaceVariant

                implicitWidth: Settings.notifItemWidth - 2 * Settings.notifItemBorder
                implicitHeight: Settings.notifItemHeight
                Layout.alignment: Qt.AlignHCenter

                MText {
                    id: notifSum
                    color: Theme.colorOnSurfaceVariant
                    font.pointSize: Settings.notifSumFontSize
                    text: notif.modelData.summary
                    // used to print font.pointSize
                    // text: "<a href=\"http://qt-project.org\">Qt Project website</a>"
                    // onLinkHovered: {
                    //     console.log(notifSum.fontInfo.pointSize);
                    // }
                }
            }
        }
    }
}

