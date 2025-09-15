pragma Singleton

import Quickshell
import Quickshell.Services.Mpris

Singleton {
    id: root

    readonly property Mpris manager: Mpris

    property MprisPlayer currentPlayer: manager.players.values[0] ?? null

    readonly property bool isPlaying: currentPlayer.isPlaying

    function getMediaTitle(): string {
        return currentPlayer.trackTitle;
    }

    function getMediaArtist(): string {
        return currentPlayer.trackArtist || "";
    }

    function barToString(divider = "-"): string {
        var track = currentPlayer.trackTitle;
        if (track === "") {
            return "No Title";
        }

        var artist = currentPlayer.trackArtist;
        if (artist === "") {
            return track;
        }

        return track + " " + divider + " " + artist;
    }

    function toggle(): void {
        if (currentPlayer.canTogglePlaying) {
            root.currentPlayer.togglePlaying();
        } else {
            if (this.isPlaying) {
                this.pause();
            } else {
                this.play();
            }
        }
    }

    function play(): void {
        if (currentPlayer.canPlay) {
            currentPlayer.isPlaying = true;
        }
    }

    function pause(): void {
        if (currentPlayer.canPause) {
            currentPlayer.isPlaying = false;
        }
    }

    function next(): void {
        if (currentPlayer.canGoNext) {
            currentPlayer.next();
        }
    }

    function prev(): void {
        if (currentPlayer.canGoPrevious) {
            currentPlayer.previous();
        }
    }
}
