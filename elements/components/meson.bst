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
  url: pypi:e6/e4/11fc433adb18567dcf90041c54e5e65b03e9451bc1a45f9cd2dac9e9bb05/meson-0.58.1.tar.gz
  sha256sum: 3144a3da662fcf79f1e5602fa929f2821cba4eba28c2c923fe0a7d3e3db04d5d
- kind: patch
  path: patches/meson/meson-no-lib64.patch
- kind: patch
  path: patches/meson/scan-build-parameters.patch
