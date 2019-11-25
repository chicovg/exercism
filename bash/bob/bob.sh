#!/usr/bin/env bash

# bob.sh
#
# Responds to the provided input like 'Bob' the lackadaisical teenager.

main () {
    local trimmed="${1//[^0-9A-Za-z?]/}"

    if [ -z "$trimmed" ]; then
        echo "Fine. Be that way!"
    elif [[ $trimmed =~ [A-Z] ]] && [[ $trimmed =~ ^[^a-z]*\?$ ]]; then
        echo "Calm down, I know what I'm doing!"
    elif [[ $trimmed =~ [A-Z] ]] && [[ $trimmed =~ ^[^a-z]*$ ]]; then
        echo "Whoa, chill out!"
    elif [[ $trimmed =~ ^.*\?$ ]]; then
        echo "Sure."
    else
        echo "Whatever."
    fi
}

main "$@"
