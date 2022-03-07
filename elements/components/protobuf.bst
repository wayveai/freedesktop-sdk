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
  ref: v3.20.0-rc1-0-g388df0041ab711228a5c041f4df041388a0ef839
