kind: autotools

depends:
  - filename: base.bst
    type: build
  - filename: desktop/pixman.bst
  - filename: desktop/xorg-lib-x11.bst
  - filename: desktop/xorg-lib-xext.bst
  - filename: desktop/freetype.bst
  - filename: desktop/fontconfig.bst
  - filename: desktop/gtk-doc.bst

variables:
  conf-local: |
      --enable-xlib \
      --enable-ft \
      --enable-svg \
      --enable-ps \
      --enable-pdf \
      --enable-tee \
      --enable-gobject

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
    url: https://anongit.freedesktop.org/git/cairo
    track: 1.14
    ref: 7cf32a065e7c3d8721ae5f4eccf6695152fe14b7 # 1.14.12
