pragma ComponentBehavior: Bound
import Quickshell
import Quickshell.Io

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

        FileView {
            path: Settings.cache.launcher + "recent-apps.json"

            watchChanges: true
            onFileChanged: reload()
            onAdapterUpdated: writeAdapter()

            JsonAdapter {
                id: jsonFile
                property list<var> apps: []
            }

            onLoadFailed: err => {
                if (err == FileViewError.FileNotFound) {
                    this.writeAdapter();
                }
            }
        }

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
                        const app = item.modelData;
                        // if working dir is empty use user home dir (see `Settings.qml`)
                        Quickshell.execDetached({
                            command: app.command,
                            workingDirectory: app.workingDirectory ? app.workingDirectory : Settings.homeDir
                        });

                        if (!app.skipCache) {
                            // add app to recent apps
                            var elem = jsonFile.apps.find(a => a["id"] == app.id);
                            if (!elem) {
                                jsonFile.apps.unshift({
                                    id: app.id,
                                    timestamp: Date.now()
                                });
                            } else {
                                elem["timestamp"] = Date.now();
                            }
                            jsonFile.apps = [...jsonFile.apps].sort((a, b) => b.timestamp - a.timestamp);
                        }

                        this.escaped();
                    }

                    onEscaped: root.open = false
                    Keys.onTabPressed: appList.incrementCurrentIndex()
                    Keys.onBacktabPressed: appList.decrementCurrentIndex()
                    Keys.onReturnPressed: this.tryExec(appList.currentIndex)
                }

                ScriptModel {
                    id: filteredModel
                    readonly property string searchUrl: "https://www.google.com/search?q="
                    readonly property var appIndex: [...DesktopEntries.applications.values].filter(app => app.name).sort((a, b) => a.name.localeCompare(b.name)).map((app, i) => ({
                                app: app,
                                id: app.id,
                                alpha: i,
                                name: app.name.toLowerCase(),
                                comment: (app.comment || "").toLowerCase()
                            }))

                    readonly property var recentMap: {
                        const map = {};
                        jsonFile.apps.forEach((a, index) => {
                            map[a.id] = index;
                        });
                        return map;
                    }
                    values: {
                        // clean query
                        const q = root.query.trim().toLowerCase();
                        // filter string first
                        const entries = q === "" ? appIndex.slice() : appIndex.filter(e => e.name.includes(q) || e.comment.includes(q));

                        // recency first then alphabetical
                        var recentFiltered = entries.sort((a, b) => {
                            const rankA = recentMap[a.id] ?? Infinity;
                            const rankB = recentMap[b.id] ?? Infinity;
                            if (rankA !== rankB)
                                return rankA - rankB;
                            return a.alpha - b.alpha;
                        }).map(e => e.app);

                        if (recentFiltered.length <= 5) {
                            // execute finder application
                            const finder = [];
                            finder.push({
                                icon: "search",
                                name: "Find in Files: " + "\"" + root.query + "\"",
                                command: ["quickshell", "ipc", "call", "finder", "findFile", root.query],
                                skipCache: true
                            });

                            // execute as command in home dir
                            const commands = [];

                            // search on default browser
                            const search = [];
                            const url = searchUrl + encodeURIComponent(root.query.trim());
                            search.push({
                                icon: "internet-web-browser-symbolic",
                                name: "Search on Google: \"" + root.query + "\"",
                                command: ["xdg-open", url],
                                skipCache: true
                            });

                            // join everything
                            recentFiltered = recentFiltered.concat(finder, commands, search);
                        }

                        return recentFiltered;
                    }

                    // keep the first selected item
                    onValuesChanged: appList.currentIndex = 0
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
