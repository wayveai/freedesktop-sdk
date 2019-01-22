kind: compose
description: |
  Composes dependencies into the image to be exported.
  This is the point where devel is split out of the runtime,
  and we define the domains for docs and locale. We also include
  a manifest.json containing version/source information.

config:
  exclude:
  - devel
  - extra

public:
  bst:
    split-rules:
      docs:
      - '%{datadir}/runtime/docs/**'
      locale:
      - '%{datadir}/runtime/locale/**'

depends:
- filename: desktop-platform.bst
  type: build
- filename: split-locales.bst
  type: build
- filename: split-docs.bst
  type: build
- filename: platform-manifest.bst
  type: build
