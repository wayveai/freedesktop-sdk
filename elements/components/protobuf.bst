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
  ref: v3.19.1-0-g7c40b2df1fdf6f414c1c18c789715a9c948a0725
