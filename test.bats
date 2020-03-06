#!/usr/bin/env bats

# Local directory relative to PWD
# JOT_DIR=./.tmp

# Don't open interactively—touching is fine
# EDITOR=touch

# Stub out to override the system `jot` & load in env vars
jot() {
  JOT_DIR=./.tmp EDITOR=touch ./jot "${@}"
}

setup() {
  :
  # mkdir -p "${JOT_DIR}"
}

teardown() {
  :
  # rm -rf "${JOT_DIR}"
}

@test "jot --help prints usage & exits cleanly" {
  run jot --help
  [[ "${lines[0]}" == "Usage:" ]]
  [[ "${status}" == 0 ]]
}

@test "jot creates \$JOT_DIR if not exist" {
  rm -rf "${JOT_DIR}"
  [[ ! -d "${JOT_DIR}" ]]
  run jot --help
  [[ -d "${JOT_DIR}" ]]
  [[ "${status}" == 0 ]]
}

@test "jot no args makes a note from today" {
  today="$(date +%Y/%m/%d)"
  run jot
  [[ -f "${JOT_DIR}/${today}.md" ]]
  [[ "${status}" == 0 ]]
}

@test "jot --list with single note works" {
  run jot --list
  [[ "${output}" == "${today}" ]]
  [[ "${status}" == 0 ]]
}

@test "jot with simple note name works" {
  testnote1="testnote"
  run jot "${testnote1}"
  [[ -f "${JOT_DIR}/${testnote1}.md" ]]
  [[ "${status}" == 0 ]]
}

@test "jot with more complex note name works" {
  testnote2="directory/containing/some/testnote"
  run jot "${testnote2}"
  [[ -f "${JOT_DIR}/${testnote2}.md" ]]
  [[ "${status}" == 0 ]]
}

@test "jot --list with multiple notes works" {
  run jot --list
  [[ "${lines[0]}" == "${today}" ]]
  [[ "${lines[1]}" == "${testnote1}" ]]
  [[ "${lines[2]}" == "${testnote2}" ]]
  [[ "${status}" == 0 ]]
}
