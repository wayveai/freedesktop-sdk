kind: meson

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-meson.bst
  type: build
- filename: components/git-minimal.bst
  type: build
- filename: components/glib.bst
- filename: components/systemd-libs.bst
- filename: components/libsoup.bst

- filename: components/networkmanager.bst

sources:
- kind: git_tag
  url: github:endlessm/mogwai.git
  track: master
  track-extra:
  - eos3.6
  - eos3.7
  ref: Version_0.2.0-0-g59ffa4c3087a196936070bc05debc0d960c29121
