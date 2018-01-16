kind: autotools

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
  - kind: git
    url: https://anongit.freedesktop.org/git/fontconfig
    track: master
    ref: b546940435ebfb0df575bc7a2350d1e913919c34 #  2.12.6
  - kind: local
    path: elements/desktop/fontconfig-flatpak.conf
