#Requires AutoHotkey v2.0
#NoTrayIcon

DesktopIcons(Show := -1) { ; By SKAN for ahk/ah2 on D35D/D495 @ tiny.cc/desktopicons
    hProgman := WinExist("ahk_class WorkerW", "FolderView") ? WinExist()
            :  WinExist("ahk_class Progman", "FolderView")
    hShellDefView := DllCall("user32.dll\GetWindow", "ptr", hProgman, "int", 5, "ptr")
    hSysListView  := DllCall("user32.dll\GetWindow", "ptr", hShellDefView, "int", 5, "ptr")
    if (DllCall("user32.dll\IsWindowVisible", "ptr", hSysListView) != Show)
        DllCall("user32.dll\SendMessage", "ptr", hShellDefView, "ptr", 0x111, "ptr", 0x7402, "ptr", 0)
}

global DesktopHidden := false
global TaskbarHidden := false
global CursorHidden := false

HideCursor() {
    static SystemCursors := Map("APPSTARTING", 32650, "ARROW", 32512, "CROSS", 32515, "HAND", 32649, "HELP", 32651, "IBEAM", 32513, "NO", 32648,
        "SIZEALL", 32646, "SIZENESW", 32643, "SIZENS", 32645, "SIZENWSE", 32642, "SIZEWE", 32644, "UPARROW", 32516, "WAIT", 32514)
    AndMask := Buffer(128, 0xFF), XorMask := Buffer(128, 0)
    for CursorName, CursorID in SystemCursors {
        CursorHandle := DllCall("CreateCursor", "ptr", 0, "int", 0, "int", 0, "int", 32, "int", 32, "ptr", AndMask, "ptr", XorMask, "ptr")
        DllCall("SetSystemCursor", "ptr", CursorHandle, "int", CursorID)
    }
}

RestoreCursor() {
    DllCall("SystemParametersInfo", "uint", 0x57, "uint", 0, "ptr", 0, "uint", 0)
}

ShowAll(ExitReason?, ExitCode?) {
    global DesktopHidden, TaskbarHidden, CursorHidden
    if DesktopHidden {
        DesktopIcons(1)
        DesktopHidden := false
    }
    if TaskbarHidden {
        ToggleTaskbar(false)
        TaskbarHidden := false
    }
    if CursorHidden {
        RestoreCursor()
        CursorHidden := false
    }
    ExitApp
}

#F11:: {
    ; Only activate if the desktop is focused
    class := WinGetClass("ahk_id " WinActive("A"))
    if !(class = "Progman" || class = "WorkerW")
        return
    global DesktopHidden, TaskbarHidden, CursorHidden
    DesktopHidden := !DesktopHidden
    TaskbarHidden := !TaskbarHidden
    CursorHidden := !CursorHidden
    DesktopIcons(DesktopHidden ? 0 : 1)
    ToggleTaskbar(TaskbarHidden)
    if CursorHidden
        HideCursor()
    else
        RestoreCursor()
}

#HotIf GetKeyState("LWin", "P")
F11::Send("#F11")
#HotIf

ToggleTaskbar(Hide := false) {
    DetectHiddenWindows(true)
    for , class in ['Shell_TrayWnd', 'Shell_SecondaryTrayWnd'] {
        hwnd := WinExist('ahk_class ' class)
        if hwnd {
            if Hide
                WinHide('ahk_id ' hwnd)
            else
                WinShow('ahk_id ' hwnd)
        }
    }
}

OnExit ShowAll