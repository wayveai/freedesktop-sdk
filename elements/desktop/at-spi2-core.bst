kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: desktop/dbus.bst
- filename: desktop/gtk-doc.bst
  type: build
- filename: base/buildsystem-autotools.bst
  type: build
- filename: base/glib.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libatspi.so'

sources:
- kind: tar
  url: https://download.gnome.org/sources/at-spi2-core/2.26/at-spi2-core-2.26.2.tar.xz
  ref: c80e0cdf5e3d713400315b63c7deffa561032a6c37289211d8afcfaa267c2615
