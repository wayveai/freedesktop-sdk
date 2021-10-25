kind: cmake

depends:
- bootstrap-import.bst
- components/glib.bst
- components/libxml2.bst

build-depends:
- public-stacks/buildsystem-cmake.bst
- components/gobject-introspection.bst
- components/perl.bst
- components/vala.bst

variables:
  cmake-local: >-
    -DGOBJECT_INTROSPECTION=ON
    -DENABLE_GTK_DOC=OFF
    -DICAL_GLIB=ON
    -DICAL_GLIB_VAPI=ON

sources:
- kind: git_tag
  url: github:libical/libical.git
  track: master
  track-extra:
  - '3.0'
  ref: v3.0.11-0-ga4d4c3809580e0a4943d6b085f699bae4a2e9dee
