#!/usr/bin/env bash
set -euo pipefail

CSL_PATH="refs/chicago-author-date.csl"
CSL_URL="https://raw.githubusercontent.com/citation-style-language/styles/master/chicago-author-date.csl"

if [[ -f "$CSL_PATH" ]]; then
  exit 0
fi

mkdir -p refs
curl -fsSL "$CSL_URL" -o "$CSL_PATH"
echo "Downloaded CSL to $CSL_PATH"
