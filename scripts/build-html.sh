#!/usr/bin/env bash
set -euo pipefail

./tools/download-csl.sh
mkdir -p dist
mkdir -p dist/styles

cp styles/book.css dist/styles/book.css
if [[ -d assets ]]; then
  rm -rf dist/assets
  cp -R assets dist/assets
fi

if ! command -v docker >/dev/null 2>&1; then
  echo "Docker is required for builds in this project."
  exit 1
fi

PANDOC_IMAGE="pandoc/core:3.5"
PANDOC_CMD=(docker run --rm -v "$PWD":/data -w /data "$PANDOC_IMAGE")

if [[ ! -s pandoc/chapter-order.txt ]]; then
  echo "No chapter list found in pandoc/chapter-order.txt"
  exit 1
fi

mapfile -t CHAPTERS < pandoc/chapter-order.txt
"${PANDOC_CMD[@]}" --defaults pandoc/html.yaml "${CHAPTERS[@]}" -o dist/book.html

echo "HTML build complete: dist/book.html"
