pragma Singleton

import Quickshell
import Quickshell.Services.Pipewire

import QtQuick

import qs.common

Singleton {
    id: root

    property bool init: false
    property PwNode sink: Pipewire.defaultAudioSink
    property PwNode source: Pipewire.defaultAudioSource

    property var nodes: Pipewire.nodes
    property var applicationsNode: Pipewire.ready ? Pipewire.nodes.values.filter(n => n.audio !== null && n.isStream) : []

    property bool muted: this.sink.ready ? sink.audio.muted : false
    property int volume: this.sink.ready ? Math.round(this.sink.audio.volume * 100) : -1
    property real rawVolume: this.sink.ready ? this.sink.audio.volume : -1
    property string volumeIcon: this.sink.ready && !muted ? (this.rawVolume >= 0.5 ? "volume-3" : (this.rawVolume > 0 ? "volume-2" : "volume-1")) : "volume-off"

    PwObjectTracker {
        objects: Pipewire.nodes.values
    }

    function getAudioLevelIcon(level: real): string {
        return level > 0 ? (level >= 0.7 ? "volume-3" : (level > 0.3 ? "volume-2" : "volume-1")) : "volume-0";
    }

    function getSourceDescription() {
        return this.source.description;
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
