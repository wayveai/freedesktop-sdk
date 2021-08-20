kind: autotools

depends:
- bootstrap-import.bst
- components/curl.bst
- components/libyaml.bst

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/flatpak-minimal.bst  # there's a version check during configure

runtime-depends:
- components/git.bst
- components/tar.bst
- components/gzip.bst
- components/zip.bst

variables:
  conf-local: >-
    --disable-documentation
    --with-system-debugedit

sources:
- kind: git_tag
  url: github:flatpak/flatpak-builder.git
  track: master
  match:
  - 1.*
  ref: 1.1.1-0-g10658573f207effe4c8459f265fc9f111cff7739
- kind: git_module
  path: subprojects/libglnx
  url: gnome:libglnx.git
  ref: 470af8763ff7b99bec950a6ae0a957c1dcfc8edd
