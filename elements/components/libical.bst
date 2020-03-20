kind: cmake

depends:
- bootstrap-import.bst
- components/glib.bst
- components/libxml2.bst

build-depends:
- public-stacks/buildsystem-cmake.bst
- components/perl.bst

sources:
- kind: git_tag
  url: github:libical/libical.git
  track: master
  ref: v3.0.8-0-g56becf417356d8ddfb3bbffd45426d45da76bc9f
