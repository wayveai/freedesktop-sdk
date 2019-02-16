kind: script

depends:
  - filename: gnu-config.bst
    type: build
  - filename: gcc-stage2.bst
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
  - element: gcc-stage2.bst
    destination: "/"
  - element: debugedit-host.bst
    destination: "/"

  - element: glibc.bst
    destination: "%{sysroot}"
