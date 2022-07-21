kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst

depends:
- bootstrap-import.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libxcvt.so'

sources:
- kind: git_tag
  url: freedesktop:xorg/lib/libxcvt.git
  track: master
  ref: libxcvt-0.1.2-0-gd9ca87eea9eecddaccc3a77227bcb3acf84e89df
