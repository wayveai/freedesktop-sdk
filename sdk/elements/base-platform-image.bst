kind: compose

config:
  exclude:
    - devel

public:
  bst:
    split-rules:
      docs:
        - "%{datadir}/runtime/docs/**"
      locale:
        - "%{datadir}/runtime/locale/**"

depends:
- filename: base-platform.bst
  type: build
- filename: split-locales.bst
  type: build
- filename: split-docs.bst
  type: build
- filename: base/llvm6.bst
  type: build
