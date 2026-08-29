# TODO

- [X] Powermenu
- [X] Wallpaper picker
- [X] **Screen lock**
- [ ] Phone link
- [X] TODO list
- [X] System Tray
    - [X] icons
    - [X] applications menu/actions
    - [X] menu positioning
- [ ] Wifi Networks
    - [X] network list
    - [X] network interactions
    - [ ] network icons
- [ ] Wired Networks
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
    - [X] better layout (maybe icon on the left, name above and slider below, mute on the right)
    - [X] volume slider
    - [ ] fixed slider position and vertical support
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
- [X] Sample control widgets panel to show
- [X] Change Utility and RightPanel component activation (`visible` property should be better)
  - [X] Utility
  - [X] RightPanel

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
