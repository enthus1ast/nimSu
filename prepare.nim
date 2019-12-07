import terminal, shared, os

let pw = readPasswordFromStdin()
let pwhash = harden(pw)

discard execShellCmd("nim c -d:release --opt:speed --passl:-s -d:pwhash:" & pwhash & " nimsu.nim")
discard execShellCmd("sudo chown root:root nimsu")
discard execShellCmd("sudo chmod u+s nimsu")
echo "done"
