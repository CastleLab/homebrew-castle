#! /bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

echo 'Clean Formulas...'
rm -rf "$DIR"/../Formula/*

files=$(find "$DIR"/../taps -type f -name '*.rb')
for file in $files ; do
    name=$(basename "$file")
    sym_path="$DIR"/../Formula/"$name"

    if [ -f "$sym_path" ]; then
        echo Error: Formulas conflict with duplicate name: "$name"
        exit 1
    fi

    echo 'Link' "$file"
    ln -s "$file" "$sym_path"
done