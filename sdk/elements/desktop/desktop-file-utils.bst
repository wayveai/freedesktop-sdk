kind: autotools

depends:
  - filename: bootstrap-import.bst
  - filename: base/pkg-config.bst
    type: build
  - filename: base/glib.bst

sources:
  - kind: tar
    url: https://www.freedesktop.org/software/desktop-file-utils/releases/desktop-file-utils-0.23.tar.xz
    ref: 6c094031bdec46c9f621708f919084e1cb5294e2c5b1e4c883b3e70cb8903385

