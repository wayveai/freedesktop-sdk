kind: pip

build-depends:
- public-stacks/buildsystem-python.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: meson
  ref:
    sha256sum: 3b51d451744c2bc71838524ec8d96cd4f8c4793d5b8d5d0d0a9c8a4f7c94cd6f
    suffix: c5/03/fa2ec33f079e9b31bbd2154257cdfe51de3f085139e75aa945fd2ecdfe86/meson-0.63.0.tar.gz
- kind: patch
  path: patches/meson/meson-no-lib64.patch
