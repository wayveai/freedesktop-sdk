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

  cpe:
    version: '2.33.2'
    vendor: 'gnome'

sources:
- kind: git_tag
  url: gnome:at-spi2-core
  track: master
  ref: AT_SPI2_CORE_2_33_2-0-g5604b79d72179708b218ddaaf226fc38614ca4a9
