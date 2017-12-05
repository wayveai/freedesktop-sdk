kind: myautotools

depends:
  - filename: base.bst
    type: build
  - filename: desktop/freetype.bst

config:
  build-commands:
    (<):
      - |
        rm -f src/fcobjshash.h

  install-commands:
    (>):
    - |
      install -m 0644 -p -T fontconfig-flatpak.conf %{install-root}%{sysconfdir}/fonts/conf.d/50-flatpak.conf

public:
  bst:
    split-rules:
      devel:
        (>):
          - "%{libdir}/libfontconfig.so"

sources:
  - kind: tar
    url: https://www.freedesktop.org/software/fontconfig/release/fontconfig-2.12.6.tar.bz2
    ref: cf0c30807d08f6a28ab46c61b8dbd55c97d2f292cf88f3a07d3384687f31f017
  - kind: local
    path: elements/desktop/fontconfig-flatpak.conf
