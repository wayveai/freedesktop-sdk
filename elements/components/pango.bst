kind: meson

build-depends:
- components/gobject-introspection.bst
- public-stacks/buildsystem-meson.bst
- components/gtk-doc.bst

depends:
- bootstrap-import.bst
- components/cairo.bst
- components/harfbuzz.bst
- components/fontconfig.bst
- components/fribidi.bst
- components/libthai.bst
- components/xorg-lib-xft.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libpango-1.0.so'
        - '%{libdir}/libpangoft2-1.0.so'
        - '%{libdir}/libpangocairo-1.0.so'
        - '%{libdir}/libpangoxft-1.0.so'

# Those are the defaults which we explicitly match.
variables:
  meson-local: >-
    -Dgtk_doc=false
    -Dintrospection=enabled
    -Dinstall-tests=false

sources:
- kind: git_tag
  url: gnome:pango.git
  track: pango-1-48
  ref: 1.48.10-0-gdc5bde2a20cbb025c9d0ed29ed687740a4d027da
