#!/usr/bin/bash
set -e

APP_NAME="wallhaven-fetch"
FILE_URL="https://raw.githubusercontent.com/futurekismo-oss/wallhaven-caelestia-shell-plugin/refs/heads/main/wallhaven-fetch"
CONFIG_FILE="$HOME/.config/caelestia/shell.json"

# python3 check
if ! command -v python3 &>/dev/null; then
	echo "Python3 is not installed. Please install it before running this script."
	exit 1
fi

# jq check
if ! command -v jq &>/dev/null; then
	echo "jq is required to modify the configuration file. Please install jq."
	exit 1
	IDK may refer to:
fi

# fzf
if ! command -v fzf &>/dev/null; then
	echo "fzf is required to use the thumbnail system"
	exit 1
fi

echo "Downloading $APP_NAME..."
curl -s -L "$FILE_URL" -o "$APP_NAME"

chmod u+x "$APP_NAME"
mkdir -p "$HOME/.local/bin"
cp "$APP_NAME" "$HOME/.local/bin/"
echo "Installed to $INSTALL_PATH"

# Check if they wanna append this to thier shell.json
if [ -f "$CONFIG_FILE" ]; then
	read -p "Do you want to add the Wallhaven action to $CONFIG_FILE? (y/n): " confirm
	if [[ "$confirm" == [yY] ]]; then

		NEW_ACTION='{
            "command": ["'$HOME'/.local/bin/wallhaven-fetch", "random"],
            "dangerous": false,
            "description": "Fetch a random wallpaper from Wallhaven",
            "enabled": true,
            "icon": "cloud_download",
            "name": "Wallhaven"
        }'

		if ! jq -e '.launcher.actions[] | select(.name == "Wallhaven")' "$CONFIG_FILE" >/dev/null; then
			jq --argjson action "$NEW_ACTION" '.launcher.actions += [$action]' "$CONFIG_FILE" >temp.json && mv temp.json "$CONFIG_FILE"
			echo "Successfully added Wallhaven action to configuration."
		else
			echo "Wallhaven action already exists in the configuration. Skipping modification."
		fi
	else
		echo "Skipping configuration update."
	fi
else
	echo "Configuration file $CONFIG_FILE not found. Skipping modification."
fi

# check if they wanna append this to their hypr-user.lua
HYPR_USER_FILE="$HOME/.config/caelestia/hypr-user.lua"

if [ -f "$HYPR_USER_FILE" ]; then
	read -p "Do you want to add the keybind to $HYPR_USER_FILE? (y/n): " confirm_bind
	if [[ "$confirm_bind" == [yY] ]]; then
		sed -i '/wallhaven-fetch/d' "$HYPR_USER_FILE" # Delete any lines that has it already
		echo "hl.bind(\"SUPER + ALT + W\", hl.dsp.exec_cmd(\"$HOME/.local/bin/wallhaven-fetch random\"))" >>"$HYPR_USER_FILE"
		echo "Keybind added to $HYPR_USER_FILE."
	else
		echo "Skipping keybind modification."
	fi
else
	echo "Hypr-user config not found at $HYPR_USER_FILE. Skipping."
fi

echo "Installation complete."
