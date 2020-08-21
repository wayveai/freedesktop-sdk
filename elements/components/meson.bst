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
  url: pypi:33/fa/79ee2dedf921e5573b8fbf2cfb120d86d12097a446d3f59fc1d71ca0362a/meson-0.55.1.tar.gz
  sha256sum: 3b5741f884e04928bdfa1947467ff06afa6c98e623c25cef75adf71ca39ce080
- kind: patch
  path: patches/meson/meson-no-lib64.patch
- kind: patch
  path: patches/meson/aarch64-can-potentially-build-arm.patch
