import Quickshell
import Quickshell.Wayland

import QtQuick

import qs.common

PanelWindow {
    id: root

    WlrLayershell.keyboardFocus: WlrKeyboardFocus.OnDemand

    color: Theme.colorSurface
}
