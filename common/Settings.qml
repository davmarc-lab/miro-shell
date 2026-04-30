pragma ComponentBehavior: Bound
pragma Singleton

import Quickshell

Singleton {
    id: root

    readonly property string shellName: "miro"

    property CacheDirs cache: CacheDirs {
        shellName: root.shellName
    }

    property ShellDirs dirs: ShellDirs {}

    property BarSettings bar: BarSettings {}
    property PanelSettings panel: PanelSettings {}
    property ItemSettings item: ItemSettings {}
    property ButtonSettings button: ButtonSettings {}

    // default user icon
    readonly property string defaultUserIcon: dirs.icons + "user.svg"

    // workspaces
    property int numWorkspaces: 10

    // wallpaper
    property string wallpaperDir: Quickshell.env("HOME") + "/Pictures/Wallpapers/"
    property string wallpaperFile: ""

    property int thumbWidth: 280
    property int thumbHeight: 200

    // buttons
    property int buttonOutlineSize: 2
    property int buttonSoftRadius: 10
    property int buttonRadius: 20
    property double iconButtonMargins: 5

    // font
    property string font: ""
    property int fontSize: 12
    property int fontTitle: 16
    property int fontSubTitle: 14

    // right panel
    property int rightIconsSize: bar.height

    // utility panel
    property int utilityPanelWidth: 600
    property int utilityPanelHeight: 600

    // notif popup panel
    property int notifPopupSize: 400
    property int notifPopupTimer: 5
    property int notifPopupBorderSize: 2

    // bar
    // property int topBarMargin: panelMargin

    // dock
    // property int dockWidth: 0
    // property real dockWidthFactor: 0.3
    // property int dockHeight: 400
    // property int dockRadius: 20

    // control panel
    // property int controlPanelWidth: 400
    // property int controlPanelHeight: 100
    // property int controlPanelMargin: 5
    // property int controlPanelRadius: 10

    // property int controlPanelBttsHeight: 100

    // in seconds
    // property int controlPanelOutTime: 1

    // notifications
    // property int notifPanelWidth: 300
    // property int notifPanelHeight: 600

    // property int notifItemWidth: 300
    // property int notifItemHeight: 80
    // property int notifItemBorder: 10

    // property int notifSumFontSize: 10
}
