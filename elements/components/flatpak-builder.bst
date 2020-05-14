kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/gettext.bst
  type: build
- filename: components/flatpak.bst
- filename: components/git.bst

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
