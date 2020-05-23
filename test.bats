#!/usr/bin/env bats

# Local directory relative to PWD
export JOT_DIR=./.tmp

# Don't open interactively—touching is fine
export EDITOR=touch

# Stub out to use local `jot`
jot() {
  ./jot "${@}"
}

setup() {
  mkdir -p "${JOT_DIR}"
}

teardown() {
  rm -rf "${JOT_DIR}"
}

@test "jot --help prints usage & exits cleanly" {
  run jot --help
  [[ "${status}" == 0 ]]
  [[ "${lines[0]}" == "Usage:" ]]
}

@test "jot creates \$JOT_DIR if not exist" {
  rm -rf "${JOT_DIR}"
  [[ ! -d "${JOT_DIR}" ]]
  run jot --help
  [[ "${status}" == 0 ]]
  [[ -d "${JOT_DIR}" ]]
}

@test "jot no args makes a note from today" {
  today="$(date +%Y/%m/%d)"
  run jot
  [[ "${status}" == 0 ]]
  [[ -f "${JOT_DIR}/${today}.md" ]]
}

@test "jot --list with single note works" {
  run jot --list
  [[ "${status}" == 0 ]]
  [[ "${output}" == "${today}" ]]
}

@test "jot with simple note name works" {
  testnote1="testnote"
  run jot "${testnote1}"
  [[ "${status}" == 0 ]]
  [[ -f "${JOT_DIR}/${testnote1}.md" ]]
}

@test "jot with more complex note name works" {
  testnote2="directory/containing/some/testnote"
  run jot "${testnote2}"
  [[ "${status}" == 0 ]]
  [[ -f "${JOT_DIR}/${testnote2}.md" ]]
}

@test "jot --list with multiple notes works" {
  today="$(date +%Y/%m/%d)"
  testnote1="testnote"
  jot && jot "${testnote1}"
  run jot --list
  [[ "${status}" == 0 ]]
  [[ "${#lines[@]}" == 2 ]]
  [[ "${lines[0]}" == "${today}" ]]
  [[ "${lines[1]}" == "${testnote1}" ]]
}
