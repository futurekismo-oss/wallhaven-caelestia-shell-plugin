#!/usr/bin/env bash

set -e

APP_NAME="wallhaven-fetch"
FILE_URL="https://raw.githubusercontent.com/futurekismo-oss/wallhaven-caelestia-shell-plugin/refs/heads/main/wallhaven-fetch"
INSTALL_DIR="$HOME/.local/bin"
INSTALL_PATH="$INSTALL_DIR/$APP_NAME"

TMP_DIR=$(mktemp -d)

echo "Downloading new version..."
curl -s -L "$FILE_URL" -o "$TMP_DIR/$APP_NAME"

chmod u+x "$TMP_DIR/$APP_NAME"
mkdir -p "$INSTALL_DIR"

echo "Replacing old version..."
mv "$TMP_DIR/$APP_NAME" "$INSTALL_PATH"

rm -rf "$TMP_DIR"
echo "Installed to $INSTALL_PATH"
