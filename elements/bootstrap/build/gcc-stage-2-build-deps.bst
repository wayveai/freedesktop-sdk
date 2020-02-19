kind: script

depends:
- filename: bootstrap/build/binutils-stage1.bst
  type: build
- filename: bootstrap/gnu-config.bst
  type: build

- filename: bootstrap/glibc.bst
  type: build

variables:
  install-root: "/"

config:
  layout:
  - element: bootstrap/build/binutils-stage1.bst
    destination: /
  - element: bootstrap/gnu-config.bst
    destination: /
  - element: bootstrap/glibc.bst
    destination: "%{sysroot}"
