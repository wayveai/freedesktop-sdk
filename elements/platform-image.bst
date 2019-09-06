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
  - static-blocklist
  - static-allowlist
  - vm-only

public:
  bst:
    split-rules:
      docs:
      - '%{datadir}/runtime/docs/**'
      locale:
      - '%{datadir}/runtime/locale/**'

depends:
- filename: platform.bst
  type: build
- filename: multiarch/multiarch-platform.bst
  type: build
- filename: integration/split-locales.bst
  type: build
- filename: integration/split-docs.bst
  type: build
- filename: manifests/platform-manifest.bst
  type: build
