kind: script

depends:
- filename: bootstrap/gnu-config.bst
  type: build
- filename: bootstrap/build/gcc-stage1.bst
  type: build
- filename: bootstrap/build/debug-utils.bst
  type: build

- filename: bootstrap/linux-headers.bst
  type: build

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

  - element: bootstrap/linux-headers.bst
    destination: "%{sysroot}"
