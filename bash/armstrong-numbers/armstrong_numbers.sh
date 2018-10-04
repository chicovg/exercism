#!/usr/bin/env bash
#
# Determines if the provided number is an 'Armstrong' number.
# An 'Armstrong' number is a number that is the sum of its own digits each raised to the power of the number of digits.
#

set -o errexit
set -o nounset

main () {
  local num_str="${1}"
  local length="${#num_str}"
  local sum=0;

  for ((i=0; i<$length; i++)); do
    digit=${num_str:i:1}
    sum=$(($sum + $(($digit ** $length))))
  done

  test $sum -eq ${1} && echo "true" || echo "false"
}

main "$@"