kind: autotools

depends:
  - filename: base.bst
    type: build
  - filename: desktop/freetype.bst

config:
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
    ref: f075ca1aeaedbc288d42a70df5cf2fd069ea0d10 #  2.13
  - kind: local
    path: files/fontconfig-flatpak.conf
