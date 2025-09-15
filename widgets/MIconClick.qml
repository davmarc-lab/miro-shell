import QtQuick

MIcon {
    id: root
    readonly property bool clicked: mouse.clicked

    signal iconClick()

    MouseArea {
        id: mouse
        anchors.fill: parent

        onClicked: {
            root.iconClick();
        }
    }

}
