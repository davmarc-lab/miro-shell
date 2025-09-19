pragma Singleton

import Quickshell
import Quickshell.Io

import qs.common

Singleton {
    id: root

    FileView {
        id: themeFile
        path: Settings.themesPath + "colorscheme.json"

        blockLoading: true
        watchChanges: true

        onFileChanged: reload()
    }
    readonly property var themeData: JSON.parse(themeFile.text())

    property string themeStyle: "dark"

    function toggleTheme(style = ""): void {
        // simple toggle if no style is passed
        if (style == "") {
            this.themeStyle = this.themeStyle == "dark" ? "light" : "dark";
            return;
        }

        // fallback for default style
        if (style != "dark" || style != "light") {
            this.themeStyle = "dark";
            return;
        }

        this.themeStyle = style;
    }

    // These properties are used to draw elements
    property string colorPrimary: themeStyle == "dark" ? darkPrimary : lightPrimary
    property string colorPrimaryHover: themeStyle == "dark" ? darkPrimaryHover : lightPrimaryHover
    property string colorOnPrimary: themeStyle == "dark" ? darkOnPrimary : lightOnPrimary
    property string colorSecondary: themeStyle == "dark" ? darkSecondary : lightSecondary
    property string colorSecondaryHover: themeStyle == "dark" ? darkSecondaryHover : lightSecondaryHover
    property string colorOnSecondary: themeStyle == "dark" ? darkOnSecondary : lightOnSecondary
    property string colorError: themeStyle == "dark" ? darkError : lightError
    property string colorOnError: themeStyle == "dark" ? darkOnError : lightOnError
    property string colorSurface: themeStyle == "dark" ? darkSurface : lightSurface
    property string colorOnSurface: themeStyle == "dark" ? darkOnSurface : lightOnSurface
    property string colorSurfaceVariant: themeStyle == "dark" ? darkSurfaceVariant : lightSurfaceVariant
    property string colorOnSurfaceVariant: themeStyle == "dark" ? darkOnSurfaceVariant : lightOnSurfaceVariant
    property string colorOutline: themeStyle == "dark" ? darkOutline : lightOutline
    property string colorShadow: themeStyle == "dark" ? darkShadow : lightShadow

    // These properties are used to edit purpose
    property string darkPrimary: root.themeData.dark.mPrimary
    property string darkPrimaryHover: root.themeData.dark.mPrimaryHover
    property string darkOnPrimary: root.themeData.dark.mOnPrimary
    property string darkSecondary: root.themeData.dark.mSecondary
    property string darkSecondaryHover: root.themeData.dark.mSecondaryHover
    property string darkOnSecondary: root.themeData.dark.mOnSecondary
    property string darkError: root.themeData.dark.mError
    property string darkOnError: root.themeData.dark.mOnError
    property string darkSurface: root.themeData.dark.mSurface
    property string darkOnSurface: root.themeData.dark.mOnSurface
    property string darkSurfaceVariant: root.themeData.dark.mSurfaceVariant
    property string darkOnSurfaceVariant: root.themeData.dark.mOnSurfaceVariant
    property string darkOutline: root.themeData.dark.mOutline
    property string darkShadow: root.themeData.dark.mShadow

    property string lightPrimary: root.themeData.light.mPrimary
    property string lightPrimaryHover: root.themeData.light.mPrimaryHover
    property string lightOnPrimary: root.themeData.light.mOnPrimary
    property string lightSecondary: root.themeData.light.mSecondary
    property string lightSecondaryHover: root.themeData.light.mSecondaryHover
    property string lightOnSecondary: root.themeData.light.mOnSecondary
    property string lightError: root.themeData.light.mError
    property string lightOnError: root.themeData.light.mOnError
    property string lightSurface: root.themeData.light.mSurface
    property string lightOnSurface: root.themeData.light.mOnSurface
    property string lightSurfaceVariant: root.themeData.light.mSurfaceVariant
    property string lightOnSurfaceVariant: root.themeData.light.mOnSurfaceVariant
    property string lightOutline: root.themeData.light.mOutline
    property string lightShadow: root.themeData.light.mShadow
}
