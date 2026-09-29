import Quickshell

import QtQuick

import qs
import qs.common
import qs.widgets

MPanelWindow {
    id: root

    implicitWidth: 700
    implicitHeight: 500

    focusable: true

    color: "transparent"

    property alias query: searchBar.text
    readonly property alias currentIndex: appList.currentIndex

    property int moveAnimationVelocity: 400
    property int moveAnimationDuration: 300

    ScriptModel {
        id: filteredModel
        values: {
            // Get all application entries from the system
            const apps = [...DesktopEntries.applications.values].filter(app => app.name).sort((a, b) => a.name.localeCompare(b.name));

            const q = root.query.trim().toLowerCase();
            if (q === "")
                return apps;

            // Filter by name or comment/description
            return apps.filter(app => {
                const nameMatch = app.name && app.name.toLowerCase().includes(q);
                const commentMatch = app.comment && app.comment.toLowerCase().includes(q);
                return nameMatch || commentMatch;
            });
        }
    }

    MRectangle {
        color: Theme.colorSurface
        anchors.fill: parent

        Item {
            id: base
            anchors.fill: parent
            anchors.margins: Settings.panel.margin

            Column {
                anchors.fill: parent
                spacing: Settings.panel.margin

                MTextInput {
                    id: searchBar
                    focus: true
                    width: parent.width
                    height: 50
                    placeholderText: "Application"

                    onEscaped: Global.enableLauncher = false
                    Keys.onTabPressed: appList.incrementCurrentIndex()
                    Keys.onBacktabPressed: appList.decrementCurrentIndex()
                    Keys.onReturnPressed: {
                        if (!appList.currentItem) {
                            // keep the focus active
                            this.focus = true;
                            return;
                        }
                        appList.currentItem.modelData.execute();
                        this.escaped();
                    }
                }

                ListView {
                    id: appList
                    width: parent.width
                    height: parent.height - searchBar.height - parent.spacing
                    keyNavigationEnabled: true
                    keyNavigationWraps: true
                    clip: true
                    spacing: Settings.item.margin

                    highlightFollowsCurrentItem: true
                    highlightMoveVelocity: root.moveAnimationVelocity
                    highlightMoveDuration: root.moveAnimationDuration

                    model: filteredModel

                    delegate: EntryDelegate {
                        required property int index
                        selected: index == root.currentIndex
                        width: ListView.view.width
                    }
                }
            }
        }
    }
}
