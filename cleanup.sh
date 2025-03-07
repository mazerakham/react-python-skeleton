#!/bin/bash

set -e

echo "Cleaning up project and moving files from tmp_root to main directory..."

# Remove all files except tmp_root
find . -maxdepth 1 -not -path "./tmp_root" -not -path "." -exec rm -rf {} \;

# Copy all files from tmp_root to current directory
cp -r tmp_root/* .

# Remove tmp_root
rm -rf tmp_root

echo "Cleanup complete!"
