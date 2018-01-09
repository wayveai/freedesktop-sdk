kind: myautotools

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
  - kind: tar
    url: https://www.cairographics.org/releases/cairo-1.14.12.tar.xz
    ref: 8c90f00c500b2299c0a323dd9beead2a00353752b2092ead558139bd67f7bf16
