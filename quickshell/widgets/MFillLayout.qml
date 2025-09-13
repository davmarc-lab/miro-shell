import QtQuick
import QtQuick.Layouts

Item {
    id: root

    property bool dx: true
    property bool dy: true

    Layout.fillWidth: dx
    Layout.fillHeight: dy
}
