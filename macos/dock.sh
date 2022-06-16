#!/bin/sh

dockutil --no-restart --remove all
dockutil --no-restart --add "/Applications/Yandex.app"
dockutil --no-restart --add "/Applications/iTerm.app"
dockutil --no-restart --add "/System/Applications/Calendar.app"
dockutil --no-restart --add "/Applications/Visual Studio Code.app"
dockutil --no-restart --add "/System/Applications/System Preferences.app"
dockutil --no-restart --add "/Applications/Telegram.app"
dockutil --no-restart --add "/Applications/Bitwarden.app"

killall Dock
