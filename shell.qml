import Quickshell

import QtQuick

import qs
import qs.modules.wallpaper
import qs.modules.bar
import qs.modules.dock
import qs.modules.powermenu
import qs.modules.rightPanel
import qs.modules.settings
import qs.services

ShellRoot {
    id: root

    property bool init: false

    Component.onCompleted: {
        SNetwork.init();
        SWallpaper.init();
        init = true;
    }

    LazyLoader {
        active: root.init && Global.enableFoo
        component: Foo {}
    }

    LazyLoader {
        active: root.init && Global.enableWallpaper
        component: Wallpaper {}
    }

    LazyLoader {
        active: root.init && Global.enableBar
        component: Bar {}
    }

    LazyLoader {
        active: root.init && Global.enableDock
        component: Dock {}
    }

    LazyLoader {
        active: root.init && Global.enablePowerMenu
        component: PowerMenu {}
    }

    LazyLoader {
        active: root.init && Global.enableWPSelector
        component: WallpaperPicker {}
    }

    LazyLoader {
        active: root.init && Global.enableSettings
        component: SettingsApp {}
    }

    LazyLoader {
        active: root.init && Global.enableRightPanel
        component: RightPanel {}
    }
}
