kind: manual

depends:
- filename: bootstrap-import.bst
- filename: base/xz.bst
- filename: base/gzip.bst

variables:
  make-vars: GZIP_SUPPORT=1 XZ_SUPPORT=1 INSTALL_DIR="%{install-root}%{bindir}"

config:
  build-commands:
  - |
    cd squashfs-tools
    make %{make-vars}

  install-commands:
  - |
    cd squashfs-tools
    make -j1 %{make-vars} install

sources:
- kind: git_tag
  url: github:plougher/squashfs-tools.git
  track: master
  track-tags: false
  ref: 6e242dc95485ada8d1d0b3dd9346c5243d4a517f
- kind: patch
  path: patches/squashfs-tools/fix-includes.patch
