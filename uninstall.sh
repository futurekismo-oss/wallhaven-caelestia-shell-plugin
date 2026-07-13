#!/usr/bin/bash

# Configuration
APP_NAME="wallhaven-fetch"
INSTALL_PATH="$HOME/.local/bin/$APP_NAME"
CONFIG_FILE="$HOME/.config/caelestia/shell.json"
HYPR_USER_FILE="$HOME/.config/caelestia/hypr-user.lua"

echo "This will remove $APP_NAME and its configurations."
read -p "Are you sure you want to proceed? (y/n): " confirm
if [[ "$confirm" != [yY] ]]; then
	echo "Uninstallation aborted."
	exit 0
fi

if [ -f "$INSTALL_PATH" ]; then
	rm "$INSTALL_PATH"
	echo "Removed $INSTALL_PATH"
else
	echo "Binary not found at $INSTALL_PATH, skipping."
fi

if [ -f "$CONFIG_FILE" ] && command -v jq &>/dev/null; then
	jq 'del(.launcher.actions[] | select(.name == "Wallhaven"))' "$CONFIG_FILE" >temp.json && mv temp.json "$CONFIG_FILE"
	echo "Removed Wallhaven entry from $CONFIG_FILE"
fi

if [ -f "$HYPR_USER_FILE" ]; then
	sed -i '/wallhaven-fetch/d' "$HYPR_USER_FILE"
	echo "Removed Wallhaven keybind from $HYPR_USER_FILE"
fi

echo "Uninstallation complete."
