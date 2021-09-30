kind: pip

build-depends:
- components/python3-pip.bst
- components/python3-wheel.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: zipp
  url: pypi:02/bf/0d03dbdedb83afec081fefe86cae3a2447250ef1a81ac601a9a56e785401/zipp-3.6.0.tar.gz
  sha256sum: 71c644c5369f4a6e07636f0aa966270449561fcea2e3d6747b8d23efaa9d7832
