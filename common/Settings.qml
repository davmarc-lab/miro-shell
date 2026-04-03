pragma Singleton

import Quickshell

Singleton {
    id: settings

    readonly property string shellName: "miro"

    readonly property string cacheDir: Quickshell.env("HOME") + "/.cache/quickshell/" + shellName + "-shell/"
    readonly property string cacheUserDir: cacheDir + "user/"
    readonly property string cacheTodoDir: cacheDir + "todo/"
    readonly property string cacheDockerDir: cacheDir + "docker/"
    readonly property string cacheCalendarDir: cacheDir + "calendar/"

    // readonly property var shellPath: Quickshell.env("HOME") + "/.config/" + shellName + "/"
    readonly property string shellPath: Quickshell.shellDir + "/"
    readonly property string themesPath: shellPath + "themes/"

    readonly property string scriptPath: shellPath + "scripts/"

    readonly property string iconsPath: shellPath + "assets/icons/"

    // default user icon
    readonly property string defaultUserIcon: iconsPath + "user.svg"

    // bar
    property int barHeight: 40

    // workspaces
    property int numWorkspaces: 10

    // wallpaper
    property string wallpaperDir: Quickshell.env("HOME") + "/Pictures/Wallpapers/"
    property string wallpaperFile: ""

    // panels
    property int panelMargin: 10
    property int itemMargin: 8
    property int itemRadius: 10

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
    property int rightIconsSize: 40

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
