#!/usr/bin/env bash

# pangram.sh
#
# Determine if a sentence is a pangram. 

main () {
    local letters="${1//[^A-Za-z]}"
    local lowerCase="${letters,,}"
    local charArray=()

    for ((i=0; i<${#lowerCase}; i++)) do
        local idx=$(printf '%d' "'${lowerCase:i:1}")

        charArray[$idx]=true
    done

    [[ ${#charArray[@]} == 26 ]] && echo "true" || echo "false"
}

main "$@"