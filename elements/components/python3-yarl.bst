kind: pip

depends:
- components/python3.bst

build-depends:
- components/python3-pip.bst
- components/python3-wheel.bst

runtime-depends:
- components/python3-idna.bst
- components/python3-multidict.bst

environment:
  YARL_NO_EXTENSIONS: '1'

sources:
- kind: pypi
  name: yarl
  url: pypi:ac/dd/59768bb3fa08e8b23e91575bca3ff8d2edbfbceebec8c59eaa24c4215791/yarl-1.5.1.tar.gz
  sha256sum: c22c75b5f394f3d47105045ea551e08a3e804dc7e01b37800ca35b58f856c3d6
