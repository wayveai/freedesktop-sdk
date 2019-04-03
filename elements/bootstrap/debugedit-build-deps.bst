kind: script

depends:
- filename: bootstrap/gnu-config.bst
  type: build
- filename: bootstrap/build/gcc-stage2.bst
  type: build
- filename: bootstrap/build/debug-utils.bst
  type: build

- filename: bootstrap/openssl.bst
  type: build
- filename: bootstrap/popt.bst
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

  - element: bootstrap/openssl.bst
    destination: "%{sysroot}"
  - element: bootstrap/popt.bst
    destination: "%{sysroot}"
  - element: bootstrap/bzip2.bst
    destination: "%{sysroot}"
  - element: bootstrap/elfutils.bst
    destination: "%{sysroot}"
  - element: bootstrap/file.bst
    destination: "%{sysroot}"
