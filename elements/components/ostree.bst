kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/git-minimal.bst
- components/gobject-introspection.bst
- components/bison.bst

depends:
- components/curl.bst
- components/glib.bst
- components/gpgme.bst
- components/e2fsprogs.bst
- components/fuse.bst
- components/systemd.bst
- components/libarchive.bst
- components/avahi.bst

variables:
  conf-local: >-
    --with-dracut
    --with-libsystemd
    --with-systemd
    --with-libarchive
    --with-avahi
    --with-curl
    --without-soup

public:
  bst:
    split-rules:
      devel:
        (>):
        - "%{libdir}/libostree.so"

sources:
- kind: git_tag
  url: github:ostreedev/ostree.git
  track: main
  match:
  - v*
  exclude:
  - v*.*.*
  ref: v2022.4-0-g5fa364d3997a6b24850cddaa3c22def85baff575
- kind: git_module
  path: libglnx
  url: gnome:libglnx.git
  ref: c59eb271b5127309c73117bbc871dcfd9fd159a6
- kind: git_module
  path: bsdiff
  url: github:mendsley/bsdiff.git
  ref: b817e9491cf7b8699c8462ef9e2657ca4ccd7667
- kind: patch
  path: patches/ostree/no-boot-symlink.patch
