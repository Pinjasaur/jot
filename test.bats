#!/usr/bin/env bats

JOT_DIR=./.tmp

jot() {
  ./jot "${@}"
}

setup() {
  mkdir -p $JOT_DIR
}

teardown() {
  rm -rf $JOT_DIR
}

@test "jot --help prints usage & exits cleanly" {
  run jot --help
  [[ "${lines[0]}" == "Usage:" ]]
  [[ "$status" == 0 ]]
}
