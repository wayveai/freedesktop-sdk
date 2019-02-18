kind: script

depends:
- filename: bootstrap/gnu-config.bst
  type: build
- filename: bootstrap/build/gcc-stage2.bst
  type: build
- filename: bootstrap/build/debugedit-build.bst
  type: build
- filename: bootstrap/readline.bst
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

  - element: bootstrap/readline.bst
    destination: "%{sysroot}"
