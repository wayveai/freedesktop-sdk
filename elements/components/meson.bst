kind: manual

build-depends:
- components/python3-installer.bst
- components/python3-setuptools.bst
- components/python3-wheel.bst

depends:
- components/python3.bst

config:
  build-commands:
  - |
    python3 setup.py bdist_wheel

  install-commands:
  - |
    python3 -minstaller dist/*.whl --destdir %{install-root}

sources:
- kind: pypi
  name: meson
  ref:
    sha256sum: 06fe13297213d6ff0121c5d5aab25a56ef938ffec57414ed6086fda272cb65e9
    suffix: 98/51/1d9a8dfd02df49cd2295f2f558ed836c616cda52c2ede6658b675aa048a4/meson-0.63.1.tar.gz
- kind: patch
  path: patches/meson/meson-no-lib64.patch
