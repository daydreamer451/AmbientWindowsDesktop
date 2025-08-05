# AmbientWindowsDesktop

## Overview

**AmbientWindowsDesktop** is an AutoHotkey v2 script designed to be compatible with Wallpaper Engine and transforms your Windows desktop into a clean, distraction-free canvas. With a single shortcut, you can hide the taskbar, desktop icons and your mouse cursor, letting your wallpaper or animated art shine without any visual clutter.

Just like Samsung's Ambient/Art Mode which turns your TV into a digital art display, this script brings a similar experience to your Desktop. It only activates when your desktop is focused, ensuring it doesn't interfere with your workflow or other applications.

## Features

- **Toggle with Win+F11:** Instantly hide/show the taskbar, desktop icons, and cursor while on the desktop.
- **No interference:** The shortcut only works when the desktop is focused, so your other windows and shortcuts remain unaffected.
- **No system tray icon:** Runs quietly in the background without adding extra clutter to your system tray.

## Installation

1. **Install [AutoHotkey v2](https://www.autohotkey.com/download/ahk-v2.exe)**  
   Download and install the latest version of AutoHotkey v2.

2. **Download the Script**  
   Get the latest release of `AmbientWindowsDesktop.ahk` from the [Releases section](https://github.com/daydreamer451/AmbientWindowsDesktop/releases).

3. **Unzip the Release**  
   The downloaded release will be a `.zip` file, extract it using your preferred tool.  
   - [7-Zip](https://www.7-zip.org/) is a free and recommended option.

4. **Run the Script**  
   Double-click the extracted `.ahk` file to start the script.  
   - To stop the script, simply close it from the task manager or use the built-in exit shortcut.

## Usage

- **Activate Ambient Mode:**  
  Press `Win + F11` while your desktop is focused.  
  This will hide the taskbar, desktop icons, and cursor.

- **Restore Everything:**  
  Press `Win + F11` again, or exit the script, to bring everything back.

## Start AmbientWindowsDesktop on Startup

To have AmbientWindowsDesktop run automatically every time you log in:

1. Right-click the extracted `AmbientWindowsDesktop.ahk` file and select **Create shortcut**.
2. Press `Win + R`, type `shell:startup`, and press Enter to open your Startup folder.
3. Move the shortcut you just created into the Startup folder.

This way, the script will launch automatically at startup.  
*Tip: If you update the script, simply replace the `.ahk` file—the shortcut will continue to work with the new version.*

## Notes

- The script does **not** show a system tray icon, keeping your workspace clean.
- It only responds when the desktop is focused, so it won't interfere with other applications or shortcuts.

---

Ideal to listen to your music while admiring your wallpaper collection. Enjoy !
