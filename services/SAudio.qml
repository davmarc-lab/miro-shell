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
    property var applicationsNode: Pipewire.ready ? Pipewire.nodes.values.filter(n => n.audio !== null && n.isStream) : []

    PwObjectTracker {
        objects: Pipewire.nodes.values
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
}
