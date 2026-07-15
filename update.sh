#!/usr/bin/bash
APP_NAME="wallhaven-fetch"
FILE_URL="https://raw.githubusercontent.com/futurekismo-oss/wallhaven-caelestia-shell-plugin/refs/heads/main/wallhaven-fetch"

echo "Removing old version"
rm "$HOME/.local/bin/$APP_NAME"

echo "Downloading new version ..."
curl -s -L "$FILE_URL" -o "$APP_NAME"

chmod u+x "$APP_NAME"
mkdir -p "$HOME/.local/bin"
cp "$APP_NAME" "$HOME/.local/bin/"
echo "Installed to $INSTALL_PATH"
