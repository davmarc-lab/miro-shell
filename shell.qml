import Quickshell

import qs
import qs.modules.bar
import qs.modules.rightPanel

ShellRoot {
    LazyLoader {
        active: Global.enableFoo
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
