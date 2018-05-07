kind: compose

public:
  bst:
    split-rules:
      docs:
        - "%{datadir}/runtime/docs/**"
      locale:
        - "%{datadir}/runtime/locale/**"

depends:
- filename: bootstrap-import.bst
  type: build
- filename: just-base.bst
  type: build
- filename: just-desktop.bst
  type: build
- filename: base/man-db-generate.bst
  type: build
- filename: split-locales.bst
  type: build
- filename: flatpak-builder-configuration.bst
  type: build
- filename: multiarch-debugdir.bst
  type: build
