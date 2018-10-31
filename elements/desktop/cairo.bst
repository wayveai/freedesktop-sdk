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
- filename: base/buildsystem-autotools.bst
  type: build
- filename: base/which.bst
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
        - '%{bindir}/cairo-sphinx'
        - '%{bindir}/cairo-trace'
        - '%{libdir}/libcairo-script-interpreter.so'
        - '%{libdir}/libcairo-gobject.so'
        - '%{libdir}/libcairo.so'
        - '%{libdir}/cairo/libcairo-trace.so'

sources:
- kind: git_tag
  url: freedesktop:cairo/cairo
  track: master
  ref: 1.16.0-0-g3ad43122b21a3299dd729dc8462d6b8f7f01142d
