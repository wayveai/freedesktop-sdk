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
- filename: just-base-platform.bst
  type: build
- filename: just-desktop-platform.bst
  type: build
- filename: split-locales.bst
  type: build
- filename: split-docs.bst
  type: build
