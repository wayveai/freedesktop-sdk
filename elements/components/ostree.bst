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
- filename: components/fuse.bst
- filename: components/systemd.bst
- filename: components/libarchive.bst
- filename: components/avahi.bst

variables:
  conf-local: >-
    --with-dracut
    --with-libsystemd
    --with-systemd
    --with-libarchive
    --with-avahi

public:
  bst:
    split-rules:
      devel:
        (>):
        - "%{libdir}/libostree.so"

sources:
- kind: git_tag
  url: github:ostreedev/ostree.git
  track: master
  ref: v2019.5-0-g980ca07b03b3aa7e0012729dd6c84b0878775d93
  submodules:
    libglnx:
      checkout: true
      url: gnome:libglnx.git
    bsdiff:
      checkout: true
      url: github:mendsley/bsdiff.git
- kind: patch
  path: patches/ostree/no-boot-symlink.patch
