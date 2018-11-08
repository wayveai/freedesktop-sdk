kind: script

depends:
- filename: gnu-config.bst
  type: build
- filename: gcc-stage1.bst
  type: build
- filename: debugedit-host.bst
  type: build
- filename: glibc.bst
  type: build

variables:
  install-root: "/"

config:
  layout:
  - element: gnu-config.bst
    destination: "/"
  - element: gcc-stage1.bst
    destination: "/"
  - element: debugedit-host.bst
    destination: "/"

  - element: glibc.bst
    destination: "%{sysroot}"
