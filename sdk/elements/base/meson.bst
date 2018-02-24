kind: manual
description: Python 3

depends:
  - filename: bootstrap-import.bst
    type: build
  - filename: base/python3.bst

config:
  build-commands:
    - |
      python3 setup.py build

  install-commands:
    - |
      python3 setup.py install --root="%{install-root}"

sources:
  - kind: tar
    url: https://pypi.python.org/packages/9f/d7/3ac5066d2e41b78a8947cccccc679cdc683c225fd61dad55762018314fe6/meson-0.44.1.tar.gz
    ref: b060d8115be24d89675b9e0ab7278b970088c48c12a450b30d0d3005d58bc13c
