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
  ref: v2019.1-0-g13bcc49603b54f117c44e25dc2b457b9f25d9dc0
  submodules:
    libglnx:
      checkout: true
      url: gnome:libglnx.git
    bsdiff:
      checkout: true
      url: github:mendsley/bsdiff
