kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/git-minimal.bst
  type: build
- filename: components/gpgme.bst
- filename: components/glib.bst
- filename: components/bison.bst
- filename: components/e2fsprogs.bst
- filename: components/libsoup.bst
- filename: components/gobject-introspection.bst
  type: build

variables:
  conf-local: --disable-rofiles-fuse

public:
  bst:
    split-rules:
      devel:
        (>):
        - "%{libdir}/libostree.so"

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
