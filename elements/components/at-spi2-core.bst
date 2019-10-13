kind: meson

depends:
- filename: bootstrap-import.bst
- filename: components/dbus.bst
- filename: components/gtk-doc.bst
  type: build
- filename: public-stacks/buildsystem-meson.bst
  type: build
- filename: components/glib.bst

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
  url: gnome:at-spi2-core
  track: master
  track-extra:
  - gnome-3-32
  match:
  - AT_SPI2_CORE_*_*[02468]_*
  ref: AT_SPI2_CORE_2_34_0-0-g6da122f1e8d6b02dda0f368610ab72fc3d1720cf
