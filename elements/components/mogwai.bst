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
  ref: Release_4.0.3-0-g51b13309eda38d760c607f84fb5b0006cbe70adf
