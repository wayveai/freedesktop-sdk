kind: compose
description: |
  Composes dependencies into the image to be exported
  This is the point where devel split rules are implemented,
  and we define docs and local split rules.

public:
  bst:
    split-rules:
      docs:
      - '%{datadir}/runtime/docs/**'
      locale:
      - '%{datadir}/runtime/locale/**'

config:
  exclude:
    - extra

depends:
- filename: desktop.bst
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
