import Quickshell.Widgets

import QtQuick

import qs.common

IconImage {
    required property string name
    property string dir: Settings.iconsPath
    property bool theme: false

    source: {
        if (theme)
            return Qt.resolvedUrl(this.dir + Theme.themeStyle + "/" + this.name);
        return this.name;
    }
}
