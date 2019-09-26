#!/usr/bin/env bash

#
# Calculates the hamming difference between two DNA strains
#

set -o errexit
set -o nounset

main() {
    if [ $# -ne 2 ]
    then
        echo "Usage: hamming.sh <strand1> <strand2>"
        exit 1
    fi

    local strand1="${1}"
    local strand2="${2}"
    local count=0

    if [ ${#strand1} -ne ${#strand2} ]
    then
        echo "left and right strands must be of equal length"
        exit 1
    fi

    for ((i=0; i<${#strand1}; i++)); do
        if [ ${strand1:i:1} != ${strand2:i:1} ]
        then
            count=$(( count + 1 ))
        fi
    done

    echo $count
}

main "$@"
