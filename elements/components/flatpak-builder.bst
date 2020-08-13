kind: autotools

depends:
- bootstrap-import.bst
- components/flatpak.bst
- components/curl.bst
- components/libyaml.bst

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/gettext.bst

runtime-depends:
- components/git.bst
- components/tar.bst
- components/gzip.bst
- components/zip.bst

variables:
  conf-local: --disable-documentation

sources:
- kind: git_tag
  url: github:flatpak/flatpak-builder.git
  track: master
  match:
  - 1.*
  submodules:
    libglnx:
      checkout: true
      url: gnome:libglnx.git
  ref: 1.0.11-0-gc270877985b33ffae189ffd231c9501218db03cc
