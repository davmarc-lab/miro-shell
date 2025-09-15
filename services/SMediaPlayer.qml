pragma Singleton

import Quickshell
import Quickshell.Services.Mpris

Singleton {
    id: root

    readonly property Mpris manager: Mpris

    property MprisPlayer current: manager.players.values[0] ?? null

    readonly property bool isPlaying: current.isPlaying

    function getMediaTitle(): string {
        return current.trackTitle;
    }

    function getMediaArtist(): string {
        return current.trackArtist || "";
    }

    function barToString(divider = "-"): string {
        var track = current.trackTitle;
        if (track === "") {
            return "No Title";
        }

        var artist = current.trackArtist;
        if (artist === "") {
            return track;
        }

        return track + " " + divider + " " + artist;
    }

    function toggle(): void {
        if (current.canTogglePlaying) {
            root.current.togglePlaying();
        } else {
            if (this.isPlaying) {
                this.pause();
            } else {
                this.play();
            }
        }
    }

    function play(): void {
        if (current.canPlay) {
            current.isPlaying = true;
        }
    }

    function pause(): void {
        if (current.canPause) {
            current.isPlaying = false;
        }
    }

    function next(): void {
        if (current.canGoNext) {
            current.next();
        }
    }

    function prev(): void {
        if (current.canGoPrevious) {
            current.previous();
        }
    }

    function test(): void {
        console.log(current);
    }
}
