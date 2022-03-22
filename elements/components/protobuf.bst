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
  ref: v3.20.0-rc2-0-g854d86bb0922e08ab51eca4dbfd4717d86eb9a58
