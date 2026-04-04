import qs
import qs.services
import qs.widgets

MButton {
    text: STime.time
    onClicked: {
        Global.enableDock = !Global.enableDock;
    }
}
