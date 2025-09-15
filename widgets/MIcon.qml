import Quickshell.Widgets

import qs.common

IconImage {
    required property string name
    property string dir: Settings.iconsPath

    source: Qt.resolvedUrl(this.dir + Theme.themeStyle + "/" + this.name)
}
