import Quickshell
import Quickshell.Widgets

import QtQuick

import qs.common
import qs.widgets

Item {
    id: root
    height: 80
    required property var modelData
    required property bool selected

    property int scrollAnimDuration: 450

    signal entryClicked

    onSelectedChanged: {
        if (selected)
            timer.start();
        else {
            timer.stop();
            this.resetScrolls();
        }
    }

    function startScrolls() {
        appText.startScroll();
        commentText.startScroll();
    }

    function resetScrolls() {
        appText.resetScroll();
        commentText.resetScroll();
    }

    // delay scroll animation
    Timer {
        id: timer
        interval: root.scrollAnimDuration
        running: false
        onTriggered: root.startScrolls()
    }

    MRectangle {
        id: content
        color: Theme.colorSurfaceVariant
        anchors.fill: parent

        Row {
            id: layout
            anchors.fill: parent
            anchors.margins: Settings.item.margin
            spacing: Settings.item.margin * 2

            IconImage {
                id: appIcon
                height: parent.height
                width: height
                source: Quickshell.iconPath(root.modelData.icon, "application-x-executable")
            }

            MScrollableText {
                id: appText
                width: parent.width - (appIcon.width) - (commentText.visible ? commentText.width : 0) - (layout.children.length - 1) * layout.spacing
                height: parent.height
                text: root.modelData.name
            }

            MScrollableText {
                id: commentText
                horizontalAlignment: Qt.AlignRight
                width: parent.width * 0.5
                height: parent.height
                visible: text !== ""
                text: root.modelData.comment
                color: Theme.colorSecondary
            }
        }

        MouseArea {
            anchors.fill: parent
            onHoveredChanged: containsMouse ? root.startScrolls() : root.resetScrolls()
            onClicked: root.entryClicked()
        }

        border.color: root.selected ? Theme.colorPrimary : Theme.colorOutline
        border.width: 2
    }
}
