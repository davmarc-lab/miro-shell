pragma ComponentBehavior: Bound

import Quickshell
import Quickshell.Io

JsonObject {
    id: root

    readonly property string shell: Quickshell.shellDir + "/"
    readonly property string themes: shell + "themes/"

    readonly property string scripts: shell + "scripts/"

    readonly property string icons: shell + "assets/icons/"
    readonly property string fonts: shell + "assets/fonts/"
}
