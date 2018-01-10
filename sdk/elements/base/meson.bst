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
    url: https://pypi.python.org/packages/c0/98/bcbda7862f8ca18dbdaa57b9c51cf7333cdc59b48278ed279217cd6ad8ff/meson-0.44.0.tar.gz
    ref: 16d3481ae9e3a8a2eee06f4963d682e4080503743e0ed8dcee24efc563baf8e6
