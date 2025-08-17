#!/bin/bash

# Specify the file name you want to rename
FILE="$1"

# Check if file exists
if [ ! -f "$FILE" ]; then
  echo "File not found!"
  exit 1
fi

# Create a backup of the original file
cp "$FILE" "${FILE}.bak"
echo "Backup created: ${FILE}.bak"

# Get the creation time (timestamp) of the file
CREATION_TIME=$(stat --format=%W "$FILE")
  
# If we couldn't get the creation time, exit
if [ -z "$CREATION_TIME" ]; then
  echo "Could not retrieve creation time."
  exit 1
fi

# Format the timestamp to the desired format (IMG_YYYYMMDD_HHMMSS)
FORMATTED_TIME=$(date -d @$CREATION_TIME "+IMG_%Y%m%d_%H%M%S")

# Get the file extension
EXT="${FILE##*.}"
NEW_NAME="${FORMATTED_TIME}.${EXT}"

# Rename the file
mv "$FILE" "$NEW_NAME"

echo "File renamed to: $NEW_NAME"

