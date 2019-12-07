import os, osproc, posix, shared, terminal
let pw = readPasswordFromStdin()
const PWHASH {.strdefine.} = "default"
when not defined(PWHASH):
  echo "please provide pwhash via `nim c -d:pwhash:value"
  quit()
if harden(pw) == PWHASH:
  discard setuid(0)
  discard setgid(0)
  var p = startProcess("/usr/bin/bash", options={poParentStreams})
  discard p.waitForExit()
