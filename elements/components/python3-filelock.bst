kind: pip

build-depends:
- public-stacks/buildsystem-python.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: filelock
  url: pypi:4d/cd/3b1244a19d61c4cf5bd65966eef97e6bc41e51fe84110916f26554d6ac8c/filelock-3.6.0.tar.gz
  sha256sum: 9cd540a9352e432c7246a48fe4e8712b10acb1df2ad1f30e8c070b82ae1fed85
