#!/usr/bin/env bash

# pangram.sh
#
# Determine if a sentence is a pangram.

main() {
    local lowercase="${1,,}"

    chars=( {a..z} )
    n=26

    for ((i=0; i<n; i++)) do
        if [[ ! $lowerCase =~ ${chars[$i]} ]]
        then
            echo "false"
            return
        fi
    done

    echo "true"
}

main "$@"
