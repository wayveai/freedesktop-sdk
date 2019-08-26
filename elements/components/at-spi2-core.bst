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
      (@): include/exclude-systemd.yml

  cpe:
    version: '2.32.1'
    vendor: 'gnome'

sources:
- kind: git_tag
  url: gnome:at-spi2-core
  track: master
  track-extra:
  - gnome-3-32
  match:
  - AT_SPI2_CORE_*_*[02468]_*
  ref: AT_SPI2_CORE_2_32_1-0-g89001a86a037cfabf27e912b902929b5daeb3c55
