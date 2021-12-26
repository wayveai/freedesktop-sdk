kind: script

(@):
- elements/bootstrap/include/common.yml

build-depends:
- bootstrap/gnu-config.bst
- bootstrap/build/gcc-stage1.bst
- bootstrap/build/debug-utils.bst
- bootstrap/build/python3.bst

- bootstrap/linux-headers.bst

variables:
  install-root: "/"

config:
  layout:
  - element: bootstrap/gnu-config.bst
    destination: "/"
  - element: bootstrap/build/gcc-stage1.bst
    destination: "/"
  - element: bootstrap/build/debug-utils.bst
    destination: "/"
  - element: bootstrap/build/python3.bst
    destination: "/"

  - element: bootstrap/linux-headers.bst
    destination: "%{sysroot}"
