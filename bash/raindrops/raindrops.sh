#!/usr/bin/env bash

# raindrops.sh
#
# Converts a number to a string, the contents of which depend on the number's factors.
# - If the number has 3 as a factor, output 'Pling'.
# - If the number has 5 as a factor, output 'Plang'.
# - If the number has 7 as a factor, output 'Plong'.
# - If the number does not have 3, 5, or 7 as a factor, just pass the number's digits straight through.

set -o errexit
set -o nounset

main () {
    local num=$1
    local output=""

    if (( num % 3 == 0 ))
    then
        output+="Pling"
    fi

    if (( num % 5 == 0 ))
    then
         output+="Plang"
    fi

    if (( num % 7 == 0 ))
    then
        output+="Plong"
    fi

    echo ${output:-1}
}

main "$@"
