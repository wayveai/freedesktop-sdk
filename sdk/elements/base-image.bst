kind: compose

depends:
- filename: bootstrap-import.bst
  type: build
- filename: just-base.bst
  type: build
- filename: base/man-db-generate.bst
  type: build
