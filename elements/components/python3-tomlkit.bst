kind: pip

build-depends:
- components/python3-pip.bst
- components/python3-poetry-core.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: tomlkit
  url: pypi:c7/f0/cc387a2ff7da8f9450d6af4c108bed1f9b7289695330b6b5f412ebc8d6aa/tomlkit-0.10.0.tar.gz
  sha256sum: d99946c6aed3387c98b89d91fb9edff8f901bf9255901081266a84fb5604adcd
