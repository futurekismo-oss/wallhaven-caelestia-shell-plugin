#!/usr/bin/env bash

set -euo pipefail

APP_NAME="wallhaven-fetch"
FILE_URL="https://raw.githubusercontent.com/futurekismo-oss/wallhaven-caelestia-shell-plugin/refs/heads/main/wallhaven-fetch"

# Use the passed INSTALL_DIR if available, otherwise default to ~/.local/bin
INSTALL_DIR="${INSTALL_DIR:-$HOME/.local/bin}"
INSTALL_PATH="$INSTALL_DIR/$APP_NAME"

mkdir -p "$INSTALL_DIR"

TMP_FILE=$(mktemp "$INSTALL_DIR/.$APP_NAME.XXXXXX")

echo "Downloading latest version..."
curl -sSL -H 'Cache-Control: no-cache' "$FILE_URL" -o "$TMP_FILE"

if [ ! -s "$TMP_FILE" ]; then
	echo "Error: Downloaded file is empty." >&2
	rm -f "$TMP_FILE"
	exit 1
fi

install -m 755 "$TMP_FILE" "$INSTALL_PATH"
rm -f "$TMP_FILE"

echo "Successfully updated $APP_NAME to $INSTALL_PATH"
