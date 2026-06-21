# TODO

- [X] Powermenu
- [X] Wallpaper picker
- [X] **Screen lock**
- [ ] Phone link
- [ ] Change Weather API [wttr](https://github.com/chubin/wttr.in#usage) (needs to be evaluated since it could be inaccurate)
- [X] TODO list
- [X] System Tray
    - [X] icons
    - [X] applications menu/actions
    - [X] menu positioning
- [ ] Wifi Networks
    - [ ] network list
    - [ ] network interactions
    - [ ] network icons
    - [ ] add support for wired networks
- [ ] Bluetooth devices
- [X] Do Not Disturb
- [X] Notifications
    - [X] notification panel
    - [X] notification popup
    - [X] popup auto close
    - [X] single notification toast dismiss
    - [X] single notification dismiss
- [ ] Volume mixer
    - [X] volume manipulation
    - [ ] better layout (maybe icon on the left, name above and slider below, mute on the right)
- [ ] Calendar
    - [X] calendar basic structure
    - [X] highlight current day
    - [X] move around months
    - [X] add events
    - [X] complete events
    - [ ] use event index instead of comparing data
    - [ ] events in bar??
    - [ ] event dot below day number
    - [ ] change view??

- [ ] Calendar application to manage events categories and other stuff?
- [ ] Sample control widgets panel to show
- [ ] Change Utility and RightPanel component activation (`visible` property should be better)

## Fix
- [ ] First time using shell
- [ ] Press ESC to close a Popup
- [X] Press ENTER to press a button (TODO => Add button)
- [X] Fix battery percentage
- [x] Doesn't change workspaces with mouse sometimes
- [ ] `SystemTray.qml::trimUrl()` needs refactor
- [X] fix system tray menu icons
- [ ] volume mixer value reset when next()
- [X] fix slider sizes
- [X] vertical slider doesn't work
- [ ] refactor `ColorEdit`
- [ ] wifi used not tracked

## Critical Fix
- [X] Write to JSON files (JSONAdapter)
- [ ] Fix Popup focus
- [x] Fix Utility => TODO scrollable item
- [ ] Fix NotificationItem size
- [ ] Whole code refactor
- [X] Errors with shell path
- [ ] Init script doesn't work
- [ ] Keyboard layout dependencies???
- [X] Wifi JSON file problem if not exist (i think)
- [x] Errors while closing notification toast (not consistent)
- [X] Errors during `ClearAll` notification from `RightPanel` (on `dismiss()`)
- [X] Checkbox in controls viewer doesn't work
- [x] Sometimes `segmentation fault` due to Notifications (i think)

## Other features
- [ ] Calendar events in Dock panel
- [ ] Colorscheme picker
- [ ] Implement colorscheme loader
- [ ] Implement colorscheme save system
- [ ] Resource Usage
- [ ] Refactor RightPanel module
