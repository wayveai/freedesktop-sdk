kind: meson

depends:
- bootstrap-import.bst
- components/glib.bst

build-depends:
- public-stacks/buildsystem-meson.bst
- components/gtk-doc.bst

sources:
- kind: git_tag
  url: github:flatpak/libportal.git
  track: master
  ref: 0.3-0-g7b11b2a42fd4e7681bd38f3986b47108c0a3cc66
