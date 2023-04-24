#!/bin/bash

set -e

echo "Creating the output directory $OUT_DIR..."
mkdir -p "$OUT_DIR"

for filename in *.tex *.cls; do
    [ -f "$filename" ] || break
    echo "Updating the build number ${GITHUB_SHA::7} in file $filename..."
    sed -ie "s/%BuildHash%/${GITHUB_SHA::7}/" "$filename"
done

for filename in *.tex; do
    [ -f "$filename" ] || break
    echo "Converting $filename to PDF..."
    # building twice to generate the page count first,
    # which is used to place the footer
    xelatex -output-directory "$OUT_DIR" "$filename"
    xelatex -output-directory "$OUT_DIR" "$filename"
done

