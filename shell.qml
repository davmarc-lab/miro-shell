import Quickshell

import QtQuick

import qs
import qs.modules.bar
import qs.modules.rightPanel
import qs.services

ShellRoot {

    Component.onCompleted: {
        SNetwork.init();
        console.log("INIT");
    }

    LazyLoader {
        active: true
        component: Foo {}
    }

    LazyLoader {
        active: Global.enableBar
        component: Bar {}
    }

    LazyLoader {
        active: Global.enableRightPanel
        component: RightPanel {}
    }
}
