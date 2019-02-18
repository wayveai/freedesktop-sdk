kind: script

depends:
- filename: bootstrap/gnu-config.bst
  type: build
- filename: bootstrap/build/gcc-stage2.bst
  type: build
- filename: bootstrap/build/debugedit-build.bst
  type: build

- filename: bootstrap/zlib.bst
  type: build
- filename: bootstrap/bzip2.bst
  type: build
- filename: bootstrap/libstdc++-stage1.bst
  type: build

variables:
  install-root: "/"

config:
  layout:
  - element: bootstrap/gnu-config.bst
    destination: "/"
  - element: bootstrap/build/gcc-stage2.bst
    destination: "/"
  - element: bootstrap/build/debugedit-build.bst
    destination: "/"

  - element: bootstrap/zlib.bst
    destination: "%{sysroot}"
  - element: bootstrap/bzip2.bst
    destination: "%{sysroot}"
  - element: bootstrap/libstdc++-stage1.bst
    destination: "%{sysroot}"
