pragma ComponentBehavior: Bound
import QtQuick
import QtQuick.Controls

import qs.common

ComboBox {
    id: root

    model: ["Sample 1", "Sample 2", "Sample 3"]

    property int maxPopupHeight: Math.min(comboItems.contentHeight, Window.window.height - this.y - this.height - expandedArea.bottomMargin)
    // property int maxPopupHeight: 200
    property alias textColor: content.color
    property alias bgColor: back.color
    property bool invertPopup: false

    delegate: ItemDelegate {
        id: delegate
        required property var model
        required property int index

        width: expandedArea.width
        contentItem: Text {
            text: delegate.model[root.textRole]
            color: root.textColor
            elide: Text.ElideRight
            verticalAlignment: Text.AlignVCenter
        }
        highlighted: root.highlightedIndex === index

        background: MRectangle {
            id: delBack
            color: root.bgColor
            width: expandedArea.width
            radius: 0
        }

        onHighlightedChanged: delBack.color = this.highlighted ? Theme.colorSurface : root.bgColor
    }

    contentItem: MText {
        id: content
        text: root.displayText
        padding: Settings.font.comboTextPadding
        font.pixelSize: Settings.font.comboTextSize
        elide: Text.ElideRight
    }

    background: MRectangle {
        id: back
        topLeftRadius: expandedArea.opened && root.invertPopup ? 0 : Settings.item.radius
        topRightRadius: topLeftRadius
        bottomLeftRadius: expandedArea.opened && !root.invertPopup ? 0 : Settings.item.radius
        bottomRightRadius: bottomLeftRadius
    }

    popup: Popup {
        id: expandedArea
        y: root.height
        width: root.width
        bottomMargin: Settings.item.margin
        height: Math.min(contentItem.implicitHeight, root.maxPopupHeight)

        contentItem: ListView {
            id: comboItems
            clip: true
            implicitHeight: root.maxPopupHeight
            width: ListView.view.width
            model: root.popup.visible ? root.delegateModel : null
            spacing: Settings.item.margin / 2
            currentIndex: root.highlightedIndex

            ScrollIndicator.vertical: ScrollIndicator {}
        }

        background: MRectangle {
            color: Theme.colorOutline
            topLeftRadius: root.invertPopup ? Settings.item.radius : 0
            topRightRadius: topLeftRadius
            bottomLeftRadius: root.invertPopup ? 0 : Settings.item.radius
            bottomRightRadius: bottomLeftRadius
            border.color: Theme.colorPrimary
        }
    }
}
