kind: script

depends:
  - filename: binutils-stage1.bst
    type: build
  - filename: gnu-config.bst
    type: build
  - filename: glibc.bst
    type: build
  - filename: libstdc++-stage1.bst
    type: build

variables:
  install-root: "/"

config:
  layout:
    - element: binutils-stage1.bst
      destination: /
    - element: gnu-config.bst
      destination: /
    - element: glibc.bst
      destination: "%{sysroot}"
    - element: libstdc++-stage1.bst
      destination: "%{sysroot}"
