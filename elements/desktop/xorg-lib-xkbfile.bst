kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: desktop/xorg-lib-x11.bst
- filename: desktop/xorg-util-macros.bst
  type: build
- filename: base/buildsystem-autotools.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libxkbfile.so'

sources:
- kind: git_tag
  url: freedesktop:xorg/lib/libxkbfile.git
  track: master
  ref: libxkbfile-1.1.0-0-g261992d42905f209cd5bf6afcf8a7ae3aa30b3ff

