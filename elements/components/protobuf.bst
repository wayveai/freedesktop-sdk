kind: autotools

build-depends:
- components/python3-setuptools.bst
- public-stacks/buildsystem-autotools.bst

depends:
- components/python3.bst

variables:
  builddir: ''

config:
  build-commands:
    (>):
    - |
      cd python
      python3 setup.py build

  install-commands:
    (>):
    - |
      cd python
      python3 setup.py install --prefix "%{prefix}" --root "%{install-root}"

sources:
- kind: git_tag
  url: github:protocolbuffers/protobuf.git
  track: master
  ref: v3.19.4-0-g22d0e265de7d2b3d2e9a00d071313502e7d4cccf
