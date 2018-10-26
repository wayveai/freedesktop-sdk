kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: desktop/cairo.bst
- filename: desktop/harfbuzz.bst
- filename: desktop/fontconfig.bst
- filename: desktop/gobject-introspection.bst
  type: build
- filename: desktop/gtk-doc.bst
  type: build
- filename: base/buildsystem-autotools.bst
  type: build
- filename: desktop/fribidi.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libpango-1.0.so'
        - '%{libdir}/libpangoft2-1.0.so'
        - '%{libdir}/libpangocairo-1.0.so'

sources:
- kind: tar
  url: https://ftp.gnome.org/pub/gnome/sources/pango/1.42/pango-1.42.4.tar.xz
  ref: 1d2b74cd63e8bd41961f2f8d952355aa0f9be6002b52c8aa7699d9f5da597c9d

