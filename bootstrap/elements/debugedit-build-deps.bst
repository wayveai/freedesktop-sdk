kind: script

depends:
- filename: gnu-config.bst
  type: build
- filename: gcc-stage2.bst
  type: build
- filename: debugedit-host.bst
  type: build
- filename: openssl-static.bst
  type: build
- filename: popt.bst
  type: build
- filename: bzip2.bst
  type: build
- filename: elfutils.bst
  type: build
- filename: file.bst
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

  - element: openssl-static.bst
    destination: "%{sysroot}"
  - element: popt.bst
    destination: "%{sysroot}"
  - element: bzip2.bst
    destination: "%{sysroot}"
  - element: elfutils.bst
    destination: "%{sysroot}"
  - element: file.bst
    destination: "%{sysroot}"
