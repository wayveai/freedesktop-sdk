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
  ref: v3.0.4-0-ga31411fc0ff215a3e45c0caca14a2eeecef46bc5
