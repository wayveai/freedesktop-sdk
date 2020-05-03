kind: cmake

build-depends:
- filename: components/gobject-introspection.bst
- filename: components/gtk-doc.bst
- filename: public-stacks/buildsystem-cmake.bst

depends:
- filename: components/cairo.bst
- filename: components/fontconfig.bst
- filename: components/freetype.bst
- filename: components/glib.bst
- filename: components/jpeg.bst
- filename: components/nss.bst
- filename: components/openjpeg.bst
- filename: bootstrap-import.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libpoppler-cpp.so'
        - '%{libdir}/libpoppler-glib.so'
        - '%{libdir}/libpoppler.so'

sources:
- kind: git_tag
  url: freedesktop:poppler/poppler.git
  ref: poppler-0.88.0-0-g448f8e9830cb0420728e844723770a8cfb3327c0
