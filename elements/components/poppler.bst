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
  track: master
  ref: poppler-0.89.0-0-g9d996ed8218c33f616856389f6e252c7596350e8
