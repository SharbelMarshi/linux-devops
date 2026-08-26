#!/bin/bash

echo "Log Archive Tool"

log_directory="$1"
echo "Log directory: $log_directory"
if [ -z "$1" ]; then
    echo "Usage: $0 <log-directory>"
    exit 1
fi
log_directory="$1"
