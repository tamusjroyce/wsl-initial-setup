#!/bin/bash

file1=$1
file2=$2
tmpfile=$(mktemp)

retry="y"
while [[ $retry =~ ^[Yy]$ ]]
    retry="n"

    diff --new-line-format="$(printf '======= test1.txt\n%%L>>>>>>>')" --old-line-format="$(printf '<<<<<<< test2.txt\n%%L')" --unchanged-line-format='%L' "$file1" "$file2" > "$tmpfile"
    if which "$EDITOR" $> /dev/null; then
    editor=$EDITOR
    echo bad
    elif which nano; then
    editor=nano
    elif which vim; then
    editor=vim
    fi
    echo $editor
    $editor "$tmpfile"

    if cmp -s "$file1" "$file2"
    then
        printf 'No changes between file "%s" and "%s" detected...\n' "$file1" "$file2"
        exit 0
    else
        while grep -q ">>>>>>>" "$tmpfile" || grep -q "<<<<<<<" "$tmpfile"; do
            read -p "Conflicts are detected. Would you like to edit again to resolve these conflicts?" yn -r
            echo
            if [[ $yn =~ ^[Nn]$ ]]
            then
                break
            fi
            $editor "$tmpfile"
        done
    fi

    if cmp -s "$file1" "$tmpfile"; then
        printf 'No changes between file "%s" and "%s" detected...\n' "$file1" "$file2"
        exit 0
    fi

    echo
    echo

    while [[ 1 -eq 1 ]]; do
        read -p "Would you like to continue with applying this change?" yn -r
        echo
        if [[ $yn =~ ^[Nn]$ ]]
        then
            read -p "Would you like to retry from the beginning?" retry -r
            echo

            if [[ $retry =~ ^[Nn]$ ]]; then
                echo "changes cancelled"
            fi
            break
        fi
        if [[ $yn =~ ^[Yy]$ ]]
        then
            cp "$file1" "$file1".bak
            cp "$tmpfile" "$file1"
            echo "merge applied!"
            break
        fi
    done
done