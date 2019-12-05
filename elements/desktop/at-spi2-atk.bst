kind: meson

depends:
- filename: bootstrap-import.bst
- filename: desktop/atk.bst
- filename: desktop/at-spi2-core.bst
- filename: base/buildsystem-meson.bst
  type: build
- filename: base/libxml2.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libatk-bridge-2.0.so'

  cpe:
    version: '2.30.0'
    vendor: 'gnome'

sources:
- kind: git_tag
  url: gnome:at-spi2-atk.git
  track: master
  ref: AT_SPI2_ATK_2_30_0-0-g8cce3d9fa7eabfb484d9515767a80bfaca2ed8e9
