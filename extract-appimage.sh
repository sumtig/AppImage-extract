#!/bin/bash

# Select the AppImage file
APPIMAGE=$(zenity --file-selection --title="Select an AppImage to extract")

# If user cancels, exit
[ -z "$APPIMAGE" ] && exit 1

# Make it executable
chmod +x "$APPIMAGE"

# Extract
cd "$(dirname "$APPIMAGE")"
"$APPIMAGE" --appimage-extract

# Rename the extracted folder
mv squashfs-root "${APPIMAGE%.AppImage}-extracted"

# Optional: show success message
zenity --info --text="Extraction complete!"

