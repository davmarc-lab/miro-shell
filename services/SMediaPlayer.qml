pragma Singleton

import Quickshell
import Quickshell.Services.Mpris

Singleton {
    id: root

    readonly property Mpris manager: Mpris

    property MprisPlayer currentPlayer: manager.players.values[0] ?? null

    readonly property bool isPlaying: currentPlayer?.isPlaying ?? false

    function getMediaTitle(): string {
        if (currentPlayer == null)
            return "";
        return currentPlayer.trackTitle;
    }

    function getMediaArtist(): string {
        if (currentPlayer == null)
            return "";
        return currentPlayer.trackArtist || "";
    }

    function barToString(divider = "-"): string {
        if (currentPlayer == null)
            return "";

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
        if (currentPlayer == null)
            return;
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
        if (currentPlayer == null)
            return;
        if (currentPlayer.canPlay) {
            currentPlayer.isPlaying = true;
        }
    }

    function pause(): void {
        if (currentPlayer == null)
            return;
        if (currentPlayer.canPause) {
            currentPlayer.isPlaying = false;
        }
    }

    function next(): void {
        if (currentPlayer == null)
            return;
        if (currentPlayer.canGoNext) {
            currentPlayer.next();
        }
    }

    function prev(): void {
        if (currentPlayer == null)
            return;
        if (currentPlayer.canGoPrevious) {
            currentPlayer.previous();
        }
    }
}
