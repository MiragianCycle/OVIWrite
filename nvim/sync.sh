#!/bin/bash

SOURCE_DIR="/Users/theenakumaragurunathan/.config/nvim/"
DEST_DIR="/Users/theenakumaragurunathan/Documents/Github/OVIWrite/nvim/"

# This will compare the contents of the source and destination directories and copy any updates
rsync -av --delete "$SOURCE_DIR/" "$DEST_DIR/"

echo "Sync complete"
