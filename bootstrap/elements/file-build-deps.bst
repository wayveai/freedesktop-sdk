kind: script

depends:
- filename: gnu-config.bst
  type: build
- filename: gcc-stage2.bst
  type: build
- filename: debugedit-host.bst
  type: build
- filename: file-stage1.bst
  type: build
- filename: zlib.bst
  type: build

variables:
  install-root: "/"

config:
  layout:
  - element: gnu-config.bst
    destination: "/"
  - element: gcc-stage2.bst
    destination: "/"
  - element: debugedit-host.bst
    destination: "/"
  - element: file-stage1.bst
    destination: "/"

  - element: zlib.bst
    destination: "%{sysroot}"
