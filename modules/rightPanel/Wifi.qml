import QtQuick
import QtQuick.Layouts

import qs.common
import qs.services
import qs.widgets

ExpandArea {
    MText {
        anchors.centerIn: parent
        visible: SNetwork.getAvailableNetworks().length == 0
        text: "No WiFi Available"
    }

    ListView {
        id: listView
        anchors.fill: parent
        anchors.margins: Settings.panel.margin
        model: SNetwork.getAvailableNetworks()
        spacing: Settings.panel.margin
        clip: true

        delegate: MRectangle {
            id: delegateRect
            required property int index
            required property var modelData

            property bool expanded: false

            width: ListView.view.width
            height: 2 * Settings.item.margin + (expanded ? topRow.implicitHeight + expandedContent.height + Settings.item.margin : topRow.implicitHeight)

            RowLayout {
                id: topRow
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.margins: Settings.item.margin

                MText {
                    id: titleText
                    text: delegateRect.modelData.name
                    wrapMode: Text.WordWrap
                    Layout.fillWidth: true
                    Layout.alignment: Qt.AlignVCenter
                }

                MThemeIconButton {
                    id: expandButton
                    Layout.alignment: Qt.AlignVCenter
                    Layout.fillHeight: true
                    Layout.preferredWidth: this.height

                    iconName: delegateRect.expanded ? "down-arrow" : "right-arrow"

                    onIconClick: {
                        delegateRect.expanded = !delegateRect.expanded;
                    }
                }
            }

            MRectangle {
                id: expandedContent
                anchors.top: topRow.bottom
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.margins: Settings.item.margin
                height: delegateRect.expanded ? expandedArea.implicitHeight + 2 * Settings.item.margin : 0
                clip: true
                visible: delegateRect.expanded

                RowLayout {
                    id: expandedArea
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.margins: Settings.item.margin

                    MText {
                        id: expandedText
                        Layout.alignment: Qt.AlignVCenter
                        text: "Password"
                    }

                    MTextInput {
                        isPassword: true
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                    }

                    MButton {
                        text: "Send"
                    }
                }
            }
        }
    }
}
