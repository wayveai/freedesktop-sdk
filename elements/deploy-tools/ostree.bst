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
- filename: deploy-tools/fuse.bst

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
  ref: v2019.4-0-g9d39e7d91e8497987cad69a3fbed5c5fc91eebdc
  submodules:
    libglnx:
      checkout: true
      url: gnome:libglnx.git
    bsdiff:
      checkout: true
      url: github:mendsley/bsdiff
