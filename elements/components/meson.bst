kind: pip

depends:
- bootstrap-import.bst
- components/python3.bst
- components/python3-setuptools.bst

build-depends:
- components/python3-pip.bst
- components/python3-wheel.bst

sources:
- kind: pypi
  name: meson
  url: pypi:19/44/40014da9bcfc4704e88b0e946a2bcb3836d1514da6844292e4f373479006/meson-0.55.2.tar.gz
  sha256sum: 78a3f4ee3864a8fce9f028d38d900ef997fd398b851765e35a0185e5c01b11f7
- kind: patch
  path: patches/meson/meson-no-lib64.patch
- kind: patch
  path: patches/meson/aarch64-can-potentially-build-arm.patch
