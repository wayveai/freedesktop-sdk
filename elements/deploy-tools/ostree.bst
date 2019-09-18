kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/buildsystem-autotools.bst
  type: build
- filename: base/which.bst
  type: build
- filename: base/git-minimal.bst
  type: build
- filename: base/gpgme.bst
- filename: base/glib.bst
- filename: base/bison.bst
- filename: base/e2fsprogs.bst
- filename: desktop/libsoup.bst

variables:
  conf-local: --disable-rofiles-fuse

sources:
- kind: git_tag
  url: github:ostreedev/ostree
  track: master
  ref: v2019.2-0-g80435e12a7ec055195d2355b60a0882b65d42a94
  submodules:
    libglnx:
      checkout: true
      url: gnome:libglnx.git
    bsdiff:
      checkout: true
      url: github:mendsley/bsdiff
