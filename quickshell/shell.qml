import Quickshell

import QtQuick
import QtQuick.Layouts

import qs.services
import qs

ShellRoot {
    LazyLoader {
        active: Global.enableFoo
        component: Foo {}
    }
}
