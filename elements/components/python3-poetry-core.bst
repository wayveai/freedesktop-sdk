kind: pip

build-depends:
- components/python3-pip.bst

depends:
- components/python3.bst
- components/python3-intreehooks.bst
- components/python3-toml.bst

sources:
- kind: pypi
  name: poetry-core
  url: pypi:d0/b3/1017f2f6d801f1e3e4ffee3f058a10d20df1a9560aba9c5b49e92cdd9912/poetry-core-1.0.3.tar.gz
  sha256sum: 2315c928249fc3207801a81868b64c66273077b26c8d8da465dccf8f488c90c5
