import Quickshell.Io

JsonObject {
    id: root

    property int margin: 4

    property JsonObject popup: JsonObject {
        property int size: 400
        property int timer: 5
        property int borderSize: 2
    }
}
