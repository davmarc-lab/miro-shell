import QtQuick.Layouts

RowLayout {
    id: root
    property int sizex: 0
    property int sizey: 0

    Layout.fillWidth: {
        if (root.sizex == 0) {
            return true;
        }
        Layout.preferredWidth = sizex;
        return false;
    }

    Layout.fillHeight: {
        if (sizey == 0)
            return true;

        Layout.preferredHeight = sizey;
        return false;
    }
}
