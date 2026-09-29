import Quickshell

import QtQuick
import QtQuick.Layouts

import qs
import qs.common
import qs.widgets

MPopup {
    id: root

    onOpenChanged: Global.enableLauncher = this.open

    property alias query: searchBar.text
    readonly property alias currentIndex: appList.currentIndex

    property int moveAnimationVelocity: 400
    property int moveAnimationDuration: 300

    MRectangle {
        color: Theme.colorSurface
        Layout.alignment: Qt.AlignCenter
        Layout.preferredWidth: 700
        Layout.preferredHeight: 500

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

                    function tryExec(index) {
                        const item = appList.itemAtIndex(index);
                        if (item == null) {
                            // keep the focus active
                            console.log("null");
                            this.focus = true;
                            return;
                        }
                        // if working dir is empty use user home dir (see `Settings.qml`)
                        Quickshell.execDetached({
                            command: item.modelData.command,
                            workingDirectory: item.modelData.workingDirectory ? item.modelData.workingDirectory : Settings.homeDir
                        });
                        this.escaped();
                    }

                    onEscaped: root.open = false
                    Keys.onTabPressed: appList.incrementCurrentIndex()
                    Keys.onBacktabPressed: appList.decrementCurrentIndex()
                    Keys.onReturnPressed: this.tryExec(appList.currentIndex)
                }

                ScriptModel {
                    id: filteredModel
                    values: {
                        // get all application entries from the system
                        const apps = [...DesktopEntries.applications.values].filter(app => app.name).sort((a, b) => a.name.localeCompare(b.name));

                        const q = root.query.trim().toLowerCase();
                        if (q === "")
                            return apps;

                        // filter by name or comment/description
                        const filtered = apps.filter(app => {
                            const nameMatch = app.name && app.name.toLowerCase().includes(q);
                            const commentMatch = app.comment && app.comment.toLowerCase().includes(q);
                            return nameMatch || commentMatch;
                        });
                        if (filtered.length > 0)
                            return filtered;

                        // execute finder application
                        // execute as command in home dir
                        // search on default browser

                        return [];
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

                        onEntryClicked: searchBar.tryExec(index)
                    }
                }
            }
        }
    }
}
