#!/usr/bin/env bash

# local version: 2.0.0.0

# Check if the given string is a pangram

@test "empty sentence" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash pangram.sh ""
  [[ $status -eq 0 ]]
  [[ $output == "false" ]]
}

@test "perfect lower case" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash pangram.sh "abcdefghijklmnopqrstuvwxyz"
  [[ $status -eq 0 ]]
  [[ $output == "true" ]]
}

@test "only lower case" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash pangram.sh "the quick brown fox jumps over the lazy dog"
  [[ $status -eq 0 ]]
  [[ $output == "true" ]]
}

@test "missing the letter 'x'" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash pangram.sh "a quick movement of the enemy will jeopardize five gunboats"
  [[ $status -eq 0 ]]
  [[ $output == "false" ]]
}

@test "missing the letter 'h'" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash pangram.sh "five boxing wizards jump quickly at it"
  [[ $status -eq 0 ]]
  [[ $output == "false" ]]
}

@test "with underscores" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash pangram.sh "the_quick_brown_fox_jumps_over_the_lazy_dog"
  [[ $status -eq 0 ]]
  [[ $output == "true" ]]
}

@test "with numbers" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash pangram.sh "the 1 quick brown fox jumps over the 2 lazy dogs"
  [[ $status -eq 0 ]]
  [[ $output == "true" ]]
}

@test "missing letters replaced by numbers" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash pangram.sh "7h3 qu1ck brown fox jumps ov3r 7h3 lazy dog"
  [[ $status -eq 0 ]]
  [[ $output == "false" ]]
}

@test "mixed case and punctuation" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash pangram.sh "\"Five quacking Zephyrs jolt my wax bed.\""
  [[ $status -eq 0 ]]
  [[ $output == "true" ]]
}

@test "case insensitive" {
  [[ $BATS_RUN_SKIPPED == true  ]] || skip
  run bash pangram.sh "the quick brown fox jumps over with lazy FX"
  [[ $status -eq 0 ]]
  [[ $output == "false" ]]
}
