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
    - static-blocklist
    - vm-only

depends:
- filename: sdk.bst
  type: build
- filename: multiarch/multiarch-sdk.bst
  type: build
- filename: integration/split-locales.bst
  type: build
- filename: integration/split-docs.bst
  type: build
- filename: integration/flatpak-builder-configuration.bst
  type: build
- filename: integration/debug-app-link.bst
  type: build
- filename: manifests/sdk-manifest.bst
  type: build
