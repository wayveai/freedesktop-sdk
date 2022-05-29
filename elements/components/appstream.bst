kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/gtk-doc.bst
- components/itstool.bst

depends:
- components/cairo.bst
- components/curl.bst
- components/fontconfig.bst
- components/freetype.bst
- components/gdk-pixbuf.bst
- components/glib.bst
- components/glib-networking.bst
- components/gobject-introspection.bst
- components/gperf.bst
- components/libyaml.bst
- components/librsvg.bst
- components/libxml2.bst
- components/pango.bst

variables:
  meson-local: >-
    -Dstemming=false
    -Dcompose=true

sources:
- kind: git_tag
  url: github:ximion/appstream.git
  track: master
  ref: v0.15.4-0-ge1413598ec578dda89d586d48c52bb9584a07305
- kind: git_tag
  url: github:hughsie/libxmlb.git
  directory: subprojects/libxmlb
  track: main
  ref: 0.3.9-0-gc308e39ccad6673e216f92d08b3782a4ffcb23ad
