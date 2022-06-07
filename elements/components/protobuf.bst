kind: autotools

build-depends:
- components/python3-setuptools.bst
- public-stacks/buildsystem-autotools.bst

depends:
- components/python3.bst

environment:
  PROTOC: "%{build-root}/%{build-dir}/src/protoc"

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
  track-extra:
  - 3.20.x
  exclude:
  - '*rc*'
  ref: v3.20.1-0-g21027a27c4c2ec1000859ccbcfff46d83b16e1ed
