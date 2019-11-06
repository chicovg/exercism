#!/usr/bin/env bash

# acronym.sh
#
# Convert a phrase to its acronym.

main() {
    local acronym

    IFS=' ' read -r -a words <<< "${1//[^a-zA-Z\']/ }"
    for word in "${words[@]}"
    do
        acronym+="${word:0:1}"
    done

    echo "${acronym^^}"
}

main "$@"
