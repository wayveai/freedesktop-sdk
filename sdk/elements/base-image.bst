kind: compose

public:
  bst:
    split-rules:
      docs:
        - "%{datadir}/runtime/docs/**"
      locale:
        - "%{datadir}/runtime/locale/**"

depends:
- filename: base.bst
  type: build
- filename: base/man-db-generate.bst
  type: build
- filename: split-locales.bst
  type: build
- filename: split-docs.bst
  type: build
- filename: flatpak-builder-configuration.bst
  type: build
- filename: multiarch-debugdir.bst
  type: build
- filename: debug-app-link.bst
  type: build
- filename: base/rust.bst
  type: build
- filename: base/cargo.bst
  type: build
