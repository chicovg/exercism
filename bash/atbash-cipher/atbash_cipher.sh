#!/usr/bin/env bash

# atbash-cipher.sh
#
# An implementation of the atbash cipher, an ancient encryption system.

alphabet=({a..z})

declare -A CIPHER

for ((i = 0, j = "${#alphabet[@]}" - 1; i < "${#alphabet[@]}"; i++, j--)); do
	CIPHER[${alphabet[i]}]="${alphabet[j]}"
done

main() {
	local trimmed="${2//[^[:alnum:]]/}"
	local lowercase="${trimmed,,}"
	local length="${#lowercase}"
	local output=''

	for ((i = 0; i < length; i++)); do
		local char="${lowercase:i:1}"

		[[ -n ${CIPHER[$char]} ]] && output+="${CIPHER[$char]}" || output+="$char"

		if [[ $1 == "encode" ]]; then
			((i < length - 1)) && ((i % 5 == 4)) && output+=' '
		fi
	done

	echo "$output"
}

main "$@"
