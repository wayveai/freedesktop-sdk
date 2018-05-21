kind: compose

public:
  bst:
    split-rules:
      docs:
        - "%{datadir}/runtime/docs/**"
      locale:
        - "%{datadir}/runtime/locale/**"

depends:
- filename: vm/base-filesystem.bst
  type: build
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
- filename: split-docs.bst
  type: build
- filename: vm/bsp-generic.bst
  type: build
- filename: vm/initramfs/initramfs-gz.bst
  type: build
