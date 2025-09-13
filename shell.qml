import Quickshell

import QtQuick
import QtQuick.Layouts

import qs.modules.bar
import qs

ShellRoot {
    LazyLoader {
        active: Global.enableFoo
        component: Foo {}
    }

    LazyLoader {
        active: Global.enableBar
        component: Bar {}
    }
}
