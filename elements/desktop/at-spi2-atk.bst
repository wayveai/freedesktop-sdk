kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: desktop/atk.bst
- filename: desktop/at-spi2-core.bst
- filename: base/buildsystem-autotools.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libatk-bridge-2.0.so'

sources:
- kind: tar
  url: https://download.gnome.org/sources/at-spi2-atk/2.26/at-spi2-atk-2.26.2.tar.xz
  ref: 61891f0abae1689f6617a963105a3f1dcdab5970c4a36ded9c79a7a544b16a6e
