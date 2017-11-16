kind: myautotools

depends:
  - filename: base.bst
    type: build
  - filename: desktop/atk.bst
  - filename: desktop/at-spi2-core.bst

public:
  bst:
    split-rules:
      devel:
        - "%{libdir}/libatk-bridge-2.0.so"

sources:
  - kind: tar
    url: https://download.gnome.org/sources/at-spi2-atk/2.26/at-spi2-atk-2.26.0.tar.xz
    ref: d25e528e1406a10c7d9b675aa15e638bcbf0a122ca3681f655a30cce83272fb9

