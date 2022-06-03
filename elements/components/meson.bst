kind: pip

build-depends:
- public-stacks/buildsystem-python.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: meson
  ref:
    sha256sum: a7669e4c4110b06b743d57cc5d6432591a6677ef2402139fe4f3d42ac13380b0
    suffix: 89/e4/c7d8d2515d24c333fbf4fc57596b4ec8f036e215675ad0698e0f0391438e/meson-0.62.2.tar.gz
- kind: patch
  path: patches/meson/meson-no-lib64.patch
