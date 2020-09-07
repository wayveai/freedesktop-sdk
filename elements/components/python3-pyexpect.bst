kind: pip

build-depends:
- components/python3-pip.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: pyexpect
  url: pypi:9d/c9/071f65d948a51c231b3bd07a5bbfab421f2f32eb8623478e7dd8833e9984/pyexpect-1.0.20.tar.gz
  sha256sum: acaaa6f96de315dc99cac3da810156bf3829d1eb5c49180f00a4fdde82eabc76
- kind: patch
  path: patches/python3-pyexpect/no-install-tests.patch
