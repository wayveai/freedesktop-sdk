kind: meson

depends:
- filename: bootstrap-import.bst
- filename: components/atk.bst
- filename: components/at-spi2-core.bst
- filename: public-stacks/buildsystem-meson.bst
  type: build
- filename: components/libxml2.bst
  type: build

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
  ref: AT_SPI2_ATK_2_34_1-0-g043b793de2161a0548835424f4d087ac90d1172d
