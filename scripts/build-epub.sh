#!/usr/bin/env bash
set -euo pipefail

./tools/download-csl.sh
mkdir -p dist

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
"${PANDOC_CMD[@]}" --defaults pandoc/epub.yaml "${CHAPTERS[@]}" -o dist/book.epub

echo "EPUB build complete: dist/book.epub"
