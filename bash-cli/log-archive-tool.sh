#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: $0 <log-directory>"
    exit 1
fi

log_directory="$1"

if [ ! -d "$log_directory" ]; then
    echo "Error: '$log_directory' is not a valid directory."
    exit 1
fi

timestamp=$(date +"%Y%m%d_%H%M%S")

archive_directory="$HOME/log-archives"

mkdir -p "$archive_directory"

archive_name="logs_archive_${timestamp}.tar.gz"
archive_path="$archive_directory/$archive_name"

echo "Archiving: $log_directory"

tar -czf "$archive_path" "$log_directory"

if [ $? -ne 0 ]; then
    echo "Error: Failed to create archive."
    exit 1
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') - $log_directory -> $archive_name" >> "$archive_directory/archive.log"

echo "Archive created successfully."
echo "Archive: $archive_path"