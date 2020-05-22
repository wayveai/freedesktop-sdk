kind: autotools

depends:
- bootstrap-import.bst
- components/flatpak.bst

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/gettext.bst

runtime-depends:
- components/git.bst
- components/tar.bst
- components/gzip.bst
- components/xz.bst
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
  ref: 1.0.10-0-g66d2a683378e6a8b6012e25d9803f819c1563d2d
