#!/usr/bin/env bash

# luhn.sh
#
#  Given a number, determines whether or not it is valid per the Luhn formula.

main () {
    local trimmed="${1//[[:blank:]]/}"
    local length="${#trimmed}"

    if [[ $trimmed =~ [^0-9] ]] || [[ $length -le 1 ]]; then
        echo "false"
        return
    fi

    local sum=0

    for (( i=1; i <= length; i++ )); do
        local idx=$(( length - i ))
        local digit=${trimmed:idx:1}
        
        (( i % 2 == 0 )) && (( digit *= 2 ))
        (( digit > 9 )) && (( digit -= 9 ))

        (( sum += digit ))
    done

    if (( sum % 10 == 0 )); then
        echo "true"
    else
        echo "false"
    fi
}

main "$@"
