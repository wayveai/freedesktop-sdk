kind: meson

depends:
- filename: bootstrap-import.bst
- filename: components/cairo.bst
- filename: components/harfbuzz.bst
- filename: components/fontconfig.bst
- filename: components/gobject-introspection.bst
  type: build
- filename: public-stacks/buildsystem-meson.bst
  type: build
- filename: components/fribidi.bst
- filename: components/libthai.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libpango-1.0.so'
        - '%{libdir}/libpangoft2-1.0.so'
        - '%{libdir}/libpangocairo-1.0.so'

# Those are the defaults which we explicitly match.
variables:
  meson-local: |
    -Dgtk_doc=false \
    -Dintrospection=true \
    -Dinstall-tests=false

sources:
- kind: git_tag
  url: gnome:pango.git
  track: master
  ref: 1.45.4-0-gc750b3678f0ee855777e63174e38c6ea3e543756
