kind: pip

depends:
- components/python3.bst

build-depends:
- components/python3-pip.bst

sources:
- kind: pypi
  name: urllib3
  url: pypi:cb/cf/871177f1fc795c6c10787bc0e1f27bb6cf7b81dbde399fd35860472cecbc/urllib3-1.26.4.tar.gz
  sha256sum: e7b021f7241115872f92f43c6508082facffbd1c048e3c6e2bb9c2a157e28937
