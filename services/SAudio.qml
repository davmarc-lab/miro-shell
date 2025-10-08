pragma Singleton

import Quickshell
import Quickshell.Services.Pipewire

Singleton {
    id: root

    property bool init: false
    property PwNode sink: Pipewire.defaultAudioSink
    property PwNode source: Pipewire.defaultAudioSource

    PwObjectTracker {
        objects: [root.sink, root.source]
    }

    function getSourceDescription() {
        return Pipewire.defaultAudioSource.description;
    }

    function getVolume(): int {
        return Pipewire.ready ? Math.round(sink.audio.volume * 100) : "";
    }

    function setVolume(val: real) {
        if (Pipewire.ready)
            sink.audio.volume = val;
    }
}
