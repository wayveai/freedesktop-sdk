kind: meson

build-depends:
- components/gtk-doc.bst
- public-stacks/buildsystem-meson.bst

depends:
- bootstrap-import.bst
- components/libdbus.bst
- components/glib.bst

variables:
  conf-local: |
    --disable-x11

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libatspi.so'
      (@): include/_private/exclude-systemd.yml

  cpe:
    version-match: '(\d+)_(\d+)_(\d+)'
    vendor: 'gnome'

sources:
- kind: git_tag
  url: gnome:at-spi2-core.git
  track: master
  track-extra:
  - gnome-3-40
  match:
  - AT_SPI2_CORE_*_*[02468]_*
  ref: AT_SPI2_CORE_2_40_3-0-g57c644513133e9b7e259809302a25987eadfcc39
