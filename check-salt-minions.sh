#!/usr/bin/env bash
# Checks salt minion agent connections from master and writes to err log if fail.
set -e
function log {
  logger -p local0.err $1
  echo "$1"
}

function main {
  out=$(sudo salt-run --log-level=quiet manage.down)
  lc=$(echo "$out" | wc -l)
  if [ $lc -eq "0" ] ; then
    return 0
  fi
  msg="E: Total salt minion agent connetions down: $lc"
  log "$msg"
  echo "$out" | while read line; do log "E: $line salt minion agent connection down."; done
  return 2
}

main
