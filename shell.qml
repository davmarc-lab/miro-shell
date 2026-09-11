//@ pragma UseQApplication
//@ pragma IconTheme Papirus

import Quickshell

import QtQuick

import qs
import qs.common
import qs.modules.greeter
import qs.modules.wallpaper
import qs.modules.bar
import qs.modules.dock
import qs.modules.powermenu
import qs.modules.rightPanel
import qs.modules.notifications
import qs.modules.utility
import qs.modules.popup
import qs.modules.settings
import qs.services

ShellRoot {
    id: root

    property bool init: false

    Component.onCompleted: {
        Helper.prepareCache();

        Icons.init();

        Global.checkFirstRun();

        SWallpaper.init();
        SUser.init();
        SNetwork.init();
        if (Global.enableNotification)
            SNotification.init();

        if (Global.enableWeather)
            SWeather.init();

        STodo.init();
        SCalendarEvents.init();

        init = true;
    }

    LazyLoader {
        active: root.init && Global.enableFoo
        component: Foo {}
    }

    LazyLoader {
        active: root.init && Global.firstRun
        component: Greeter {}
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
        active: root.init && Global.enableVolumeSliderPopup
        component: VolumeSliderPopup {}
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

    LazyLoader {
        active: root.init && Global.enableNotification && Global.enableNotifPopups
        component: NotificationsPopup {}
    }

    LazyLoader {
        active: root.init && Global.enableUtility
        component: Utility {}
    }
}
