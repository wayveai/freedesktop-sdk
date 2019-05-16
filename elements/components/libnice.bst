kind: meson

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-meson.bst
  type: build
- filename: components/glib.bst
- filename: components/gnutls.bst
- filename: components/gstreamer.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libnice.so'

sources:
- kind: git_tag
  url: freedesktop:libnice/libnice.git
  track: master
  ref: 0.1.15-0-ge25c3e5113c7b7002a78bcca2ecf058bbf7de6d4
