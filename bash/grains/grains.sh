#!/usr/bin/env bash
#
# Calculates the number of grains of wheat on a chessboard given that the number on each square doubles.

set -o errexit
set -o nounset

grains_on_square() {
  local count
  local pow=$((${1} - 1))

  bc <<< "2 ^ $pow"
}

grains_on_chessboard() {
  local total=0

  for ((i=1; i<=64; i++)); do
    square=$(grains_on_square $i)
    total=$(bc <<< "$total + $square")
  done

  echo "$total"
}

main() {
  local input=${1}

  if [[ "$input" == "total" ]]; then
     grains_on_chessboard;
  elif [[ $input -lt 1 || $input -gt 64 ]]; then
    echo "Error: invalid input"
    exit 1
  else
    grains_on_square $input
  fi
}

main "$@"
