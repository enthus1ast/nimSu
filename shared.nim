import nimSHA2
export nimSHA2

const rounds = 10_000

proc harden*(pw: string): string =
  var sha = initSHA[SHA512]()
  sha.update(pw)
  for idx in 0..rounds:
    sha.update($sha)
  return sha.final().hex()