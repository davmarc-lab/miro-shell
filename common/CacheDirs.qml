pragma ComponentBehavior: Bound
import Quickshell
import Quickshell.Io

JsonObject {
    id: root

    required property string shellName

    readonly property string base: Quickshell.env("HOME") + "/.cache/quickshell/" + shellName + "-shell/"
    readonly property string user: base + "user/"
    readonly property string todo: base + "todo/"
    readonly property string docker: base + "docker/"
    readonly property string weather: base + "weather/"
    readonly property string calendar: base + "calendar/"
}
