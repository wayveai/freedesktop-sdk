kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst

depends:
- bootstrap-import.bst
- components/glib.bst
- components/systemd-libs.bst
- components/libsoup.bst
- components/networkmanager.bst

sources:
- kind: git_tag
  url: github:endlessm/mogwai.git
  track: master
  track-extra:
  - eos3.6
  - eos3.7
  ref: Version_0.2.0-0-g59ffa4c3087a196936070bc05debc0d960c29121
