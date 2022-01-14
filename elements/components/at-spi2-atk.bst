kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/libxml2.bst

depends:
- bootstrap-import.bst
- components/atk.bst
- components/at-spi2-core.bst

variables:
  meson-local: >-
    -Ddisable_p2p=true

config:
  install-commands:
    (>):
    - |
      # It contains useless at-spi2-atk.desktop file
      rm -rf "%{install-root}%{libdir}/gnome-settings-daemon-3.0"

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libatk-bridge-2.0.so'

  cpe:
    version-match: '(\d+)_(\d+)_(\d+)'
    vendor: 'gnome'

sources:
- kind: git_tag
  url: gnome:at-spi2-atk.git
  track: master
  track-extra:
  - gnome-3-32
  match:
  - AT_SPI2_ATK_*_*[02468]_*
  ref: AT_SPI2_ATK_2_38_0-0-gb91a111f040a09e804428a81e6de214e4962247b
