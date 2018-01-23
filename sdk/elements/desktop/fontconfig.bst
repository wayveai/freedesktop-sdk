kind: autotools

depends:
  - filename: base.bst
    type: build
  - filename: desktop/freetype.bst

config:
  configure-commands:
    (<):
      - |
        %{autogen}

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
    ref: d7d40b5aa8216f30a38492bd2bde5884c492c82d #  2.12.92
  - kind: local
    path: elements/desktop/fontconfig-flatpak.conf
