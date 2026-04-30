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

    property FontSettings font: FontSettings {}
    property WorkspaceSettings workspaces: WorkspaceSettings {}
    property BarSettings bar: BarSettings {}

    property PanelSettings panel: PanelSettings {}
    property ItemSettings item: ItemSettings {}
    property ButtonSettings button: ButtonSettings {}

    property RightPanelSettings rightPanel: RightPanelSettings {}
    property UtilityPanelSettings utilityPanel: UtilityPanelSettings {}
    property NotificationSettings notification: NotificationSettings {}

    // default user icon
    readonly property string defaultUserIcon: dirs.icons + "user.svg"

    // wallpaper
    property string wallpaperDir: Quickshell.env("HOME") + "/Pictures/Wallpapers/"
    property string wallpaperFile: ""

    // Dock ??
    property int thumbWidth: 280
    property int thumbHeight: 200
}
