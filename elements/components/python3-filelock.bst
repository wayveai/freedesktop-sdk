kind: pip

build-depends:
- public-stacks/buildsystem-python.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: filelock
  url: pypi:79/3f/aae4a951dc5bd2738901e053c057f4b317bf12199f09351f63a002442117/filelock-3.4.0.tar.gz
  sha256sum: 93d512b32a23baf4cac44ffd72ccf70732aeff7b8050fcaf6d3ec406d954baf4
