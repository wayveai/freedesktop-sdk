kind: script

(@):
- elements/bootstrap/include/common.yml

depends:
- filename: bootstrap/gnu-config.bst
  type: build
- filename: bootstrap/build/gcc-stage2.bst
  type: build
- filename: bootstrap/build/debug-utils.bst
  type: build

- filename: bootstrap/bzip2.bst
  type: build
- filename: bootstrap/elfutils.bst
  type: build
- filename: bootstrap/file.bst
  type: build

variables:
  install-root: "/"

config:
  layout:
  - element: bootstrap/gnu-config.bst
    destination: "/"
  - element: bootstrap/build/gcc-stage2.bst
    destination: "/"
  - element: bootstrap/build/debug-utils.bst
    destination: "/"

  - element: bootstrap/elfutils.bst
    destination: "%{sysroot}"
