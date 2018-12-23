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

variables:
  conf-local: --disable-rofiles-fuse

sources:
- kind: git_tag
  url: github:ostreedev/ostree
  track: master
  ref: v2018.9-0-gf3eba6bcec39c163eb831c02c148ffa483292906
  submodules:
    libglnx:
      checkout: true
      url: gnome:libglnx.git
    bsdiff:
      checkout: true
      url: github:mendsley/bsdiff
