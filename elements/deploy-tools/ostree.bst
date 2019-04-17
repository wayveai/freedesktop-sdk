kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/which.bst
  type: build
- filename: components/git-minimal.bst
  type: build
- filename: components/gpgme.bst
- filename: components/glib.bst
- filename: components/bison.bst
- filename: components/e2fsprogs.bst

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
