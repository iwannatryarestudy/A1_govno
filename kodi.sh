#!/bin/bash
adb connect 192.168.100.5:5555;
adb shell am start -n org.xbmc.kodi/org.xbmc.kodi.Splash
