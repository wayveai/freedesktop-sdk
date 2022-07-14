kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/gobject-introspection.bst
- components/gtk-doc.bst
- components/valgrind-maybe.bst

depends:
- components/avahi.bst
- components/eos-metrics.bst
- components/flatpak.bst
- components/gnupg.bst
- components/libsoup2.bst
- components/mogwai.bst
- components/networkmanager.bst
- components/ostree.bst

sources:
- kind: git_tag
  url: github:endlessm/eos-updater.git
  track: master
  track-extra:
  - eos4.0
  ref: Release_4.0.7-0-g707e99c1e64ff5645d4c2b188362baf5a75986b1
- kind: patch
  path: patches/eos-updater/eos-updater-disable-tests.patch
