#!/usr/bin/env bash

# scrabble_score.sh
#
# Given a word, compute the scrabble score for that word.

get_letter_score () {
    case "${1^^}" in
        [QZ]) echo 10;;
        [JX]) echo 8;;
        K) echo 5;;
        [FHVWY]) echo 4;;
        [BCMP]) echo 3;;
        [DG]) echo 2;;
        *) echo 1;;
    esac
}

main () {
    local score=0;

    for (( i=0; i < ${#1}; i++ )); do
        (( score += $(get_letter_score ${1:i:1}) ))
    done

    echo "$score"
}

main "$@"
