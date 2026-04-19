#!/bin/bash
set -e

if [ -z "$1" ]; then
  echo "Usage: ./update-bg.sh /path/to/photo.jpeg"
  exit 1
fi

if [ ! -f "$1" ]; then
  echo "File not found: $1"
  exit 1
fi

cp "$1" background.jpeg
sips --setProperty formatOptions 50 background.jpeg > /dev/null
SIZE=$(wc -c < background.jpeg)
echo "Compressed to $(( SIZE / 1024 ))KB"

git add background.jpeg
git commit -m "update: new background photo"
git push

echo "Done — site will update in ~1 minute"
