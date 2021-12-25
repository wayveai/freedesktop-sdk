kind: script

(@):
- elements/bootstrap/include/common.yml

build-depends:
- bootstrap/build/binutils-stage1.bst
- bootstrap/build/python3.bst
- bootstrap/gnu-config.bst

- bootstrap/glibc.bst

variables:
  install-root: "/"

config:
  layout:
  - element: bootstrap/build/binutils-stage1.bst
    destination: /
  - element: bootstrap/build/python3.bst
    destination: /
  - element: bootstrap/gnu-config.bst
    destination: /
  - element: bootstrap/glibc.bst
    destination: "%{sysroot}"
