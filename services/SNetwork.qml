pragma Singleton

import Quickshell

Singleton {
    readonly property bool wifi: false
    readonly property bool ethernet: false

    /*
     * Scans for wifi networks
     * nmcli -f IN-USE,SSID,SIGNAL device wifi list > file.txt
     *
     * Prints all lines with a number before (it works with $1,$2,$3 too)
     * awk '{print NR" " $0}' out.txt
     */

}
