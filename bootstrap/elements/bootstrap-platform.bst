kind: compose

config:
  exclude:
    - devel

depends:
- filename: coreutils.bst
  type: build
- filename: gcc.bst
  type: build
- filename: glibc.bst
  type: build
- filename: bash.bst
  type: build
- filename: gawk.bst
  type: build
- filename: findutils.bst
  type: build
- filename: grep.bst
  type: build
- filename: make.bst
  type: build
- filename: sed.bst
  type: build
- filename: readline.bst
  type: build
- filename: ncurses.bst
  type: build
- filename: diffutils.bst
  type: build
- filename: file.bst
  type: build
- filename: attr.bst
  type: build
- filename: acl.bst
  type: build
- filename: procps.bst
  type: build
- filename: zlib.bst
  type: build
