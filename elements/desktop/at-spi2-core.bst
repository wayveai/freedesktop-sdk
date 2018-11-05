kind: meson

depends:
- filename: bootstrap-import.bst
- filename: desktop/dbus.bst
- filename: desktop/gtk-doc.bst
  type: build
- filename: base/buildsystem-meson.bst
  type: build
- filename: base/glib.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libatspi.so'

sources:
- kind: git_tag
  url: gnome:at-spi2-core
  track: master
  ref: AT_SPI2_CORE_2_30_0-0-g2f3b23bb626e91aa321f06374ff66a709c323430
