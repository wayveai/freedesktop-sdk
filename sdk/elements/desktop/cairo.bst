kind: autotools

depends:
  - filename: bootstrap-import.bst
  - filename: desktop/pixman.bst
  - filename: desktop/xorg-lib-x11.bst
  - filename: desktop/xorg-lib-xext.bst
  - filename: desktop/freetype.bst
  - filename: desktop/fontconfig.bst
  - filename: desktop/gtk-doc.bst
    type: build
  - filename: base/automake.bst
    type: build
  - filename: base/libtool.bst
    type: build
  - filename: base/which.bst
    type: build
  - filename: base/pkg-config.bst
    type: build

variables:
  conf-local: |
      --enable-xlib \
      --enable-ft \
      --enable-svg \
      --enable-ps \
      --enable-pdf \
      --enable-tee \
      --enable-gobject

config:
  configure-commands:
    (<):
      - |
        %{autogen}

public:
  bst:
    split-rules:
      devel:
        (>):
          - "%{bindir}/cairo-sphinx"
          - "%{bindir}/cairo-trace"
          - "%{libdir}/libcairo-script-interpreter.so"
          - "%{libdir}/libcairo-gobject.so"
          - "%{libdir}/libcairo.so"
          - "%{libdir}/cairo/libcairo-trace.so"

sources:
  - kind: git
    url: freedesktop:cairo
    track: master
    ref: 7149686456ec3c481fa1d3dbe76a0dab1e42b519 # 1.15.12
