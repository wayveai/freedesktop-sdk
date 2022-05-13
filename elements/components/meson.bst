kind: pip

build-depends:
- public-stacks/buildsystem-python.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: meson
  ref:
    sha256sum: a0f5caa1e70da12d5e63aa6a9504273759b891af36c8d87de381a4ed1380e845
    suffix: e1/5a/951f217a0cdd76501c33827ef2a5852fd1e1b3b294360f9efeac1b4b57a4/meson-0.62.1.tar.gz
- kind: patch
  path: patches/meson/meson-no-lib64.patch
