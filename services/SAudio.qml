pragma Singleton

import Quickshell
import Quickshell.Services.Pipewire

import QtQuick

Singleton {
    id: root

    property bool init: false
    property PwNode sink: Pipewire.defaultAudioSink
    property PwNode source: Pipewire.defaultAudioSource

    property var nodes: Pipewire.nodes

    property bool muted: sink.audio.muted

    PwObjectTracker {
        objects: [root.sink, root.source, Pipewire.nodes.values]
    }

    function getSourceDescription() {
        return this.source.description;
    }

    function getVolume(): int {
        return this.sink.ready ? Math.round(this.sink.audio.volume * 100) : "";
    }

    function setVolume(val: real) {
        if (this.sink.ready)
            sink.audio.volume = val;
    }

    function getApplicationsNode() {
        if (Pipewire.ready) {
            return Pipewire.nodes.values.filter(n => n.audio !== null && n.isStream);
        }
        return [];
    }

    function getNodes() {
        if (Pipewire.ready) {
            return this.nodes;
        }
        return [];
    }

    Component.onCompleted: {
    console.log("Pipewire ready:", Pipewire.ready)
    console.log("Nodes count:", Pipewire.nodes.values.length)
    
    Pipewire.nodes.values.forEach(n => {
        console.log("Node:", n.name, "| isStream:", n.isStream, "| audio:", n.audio)
    })
}
}
