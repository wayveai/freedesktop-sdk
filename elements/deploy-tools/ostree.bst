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
  url: github:ostreedev/ostree.git
  track: master
  ref: v2019.4-0-g9d39e7d91e8497987cad69a3fbed5c5fc91eebdc
  submodules:
    libglnx:
      checkout: true
      url: gnome:libglnx.git
    bsdiff:
      checkout: true
      url: github:mendsley/bsdiff.git
