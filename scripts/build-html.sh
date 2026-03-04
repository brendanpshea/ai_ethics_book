#!/usr/bin/env bash
set -euo pipefail

./tools/download-csl.sh

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

# Remove dist directory entirely so pandoc can create it
rm -rf dist

# Run pandoc for chunked HTML output (outputs directly into the dist/ directory)
"${PANDOC_CMD[@]}" --defaults pandoc/html.yaml -t chunkedhtml "$@" "${CHAPTERS[@]}" -o dist/ --split-level=1

# Now copy assets and styles since dist/ has been created by pandoc
mkdir -p dist/styles
cp styles/book.css dist/styles/book.css

if [[ -d assets ]]; then
  cp -R assets dist/assets
fi

echo "HTML build complete: dist/"
