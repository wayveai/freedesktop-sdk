kind: meson

depends:
- filename: bootstrap-import.bst
- filename: components/atk.bst
- filename: components/at-spi2-core.bst
- filename: public-stacks/buildsystem-meson.bst
  type: build
- filename: components/libxml2.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libatk-bridge-2.0.so'

  cpe:
    version: '2.33.2'
    vendor: 'gnome'

sources:
- kind: git_tag
  url: gnome:at-spi2-atk
  track: master
  ref: AT_SPI2_ATK_2_33_2-0-gf38fed479a6b9ae3df5bef71a609b6e8accfd84e
