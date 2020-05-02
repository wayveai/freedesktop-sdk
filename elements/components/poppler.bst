kind: cmake

build-depends:
- filename: components/gtk-doc.bst
- filename: public-stacks/buildsystem-cmake.bst

depends:
- filename: components/cairo.bst
- filename: components/gobject-introspection.bst
- filename: components/fontconfig.bst
- filename: components/freetype.bst
- filename: components/jpeg.bst
- filename: components/nss.bst
- filename: components/openjpeg.bst
- filename: bootstrap-import.bst

sources:
- kind: git_tag
  url: freedesktop:poppler/poppler.git
  ref: poppler-0.88.0-0-g448f8e9830cb0420728e844723770a8cfb3327c0
