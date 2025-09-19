import QtQuick.Layouts

ColumnLayout {
    id: root

    property string title: ""
    property string icon: ""
    property real customWidth: parent.width

    Layout.preferredWidth: customWidth

    MContentItem {
        sizex: root.customWidth
        sizey: title.height

        MTitle {
            id: title
            Layout.alignment: Qt.AlignTop
            text: root.icon + root.title
        }
    }
}
