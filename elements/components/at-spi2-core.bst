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
    version: '2.30.0'
    vendor: 'gnome'

sources:
- kind: git_tag
  url: gnome:at-spi2-core
  track: master
  ref: AT_SPI2_CORE_2_30_0-0-g2f3b23bb626e91aa321f06374ff66a709c323430
