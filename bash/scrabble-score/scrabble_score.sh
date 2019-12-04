#!/usr/bin/env bash

# scrabble_score.sh
#
# Given a word, compute the scrabble score for that word.

main () {
    local score=0;

    for (( i=0; i<${#1}; i++ )); do
        local letter=${1:i:1}

        case "${letter^^}" in
            Q | Z)
                (( score+=10 ))
                ;;
            J | X)
                (( score+=8 ))
                ;;
            K)
                (( score+=5 ))
                ;;
            F | H | V | W | Y)
                (( score+=4 ))
                ;;
            B | C | M | P)
                (( score+=3 ))
                ;;
            D | G)
                (( score+=2 ))
                ;;
            *)
                (( score+=1 ))
                ;;
        esac
    done

    echo $score
}

main "$@"
