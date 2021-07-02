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
  url: pypi:5d/0e/0c72dadd01af2da712eb987e2b7662e2e2c2c34fcdfe3cc6d765bddb2db3/meson-0.57.2.tar.gz
  sha256sum: 3a83e7b1c5de94fa991ec34d9b198d94f38ed699d3524cb0fdf3b99fd23d4cc5
- kind: patch
  path: patches/meson/meson-no-lib64.patch
- kind: patch
  path: patches/meson/scan-build-parameters.patch
