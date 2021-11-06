kind: pip

build-depends:
- public-stacks/buildsystem-python.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: filelock
  url: pypi:4f/c5/477ff63917e7670fe1f338a0226fbb1f654e4cbb2656f5c3ba81f5c26929/filelock-3.3.2.tar.gz
  sha256sum: 7afc856f74fa7006a289fd10fa840e1eebd8bbff6bffb69c26c54a0512ea8cf8
