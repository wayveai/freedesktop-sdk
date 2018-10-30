kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: desktop/freetype.bst
- filename: base/gperf.bst
  type: build
- filename: base/buildsystem-autotools.bst
  type: build
- filename: base/gettext.bst
  type: build

variables:
  conf-local: |
    --with-templatedir="%{sysconfdir}/fonts/conf.avail"

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
        - '%{libdir}/libfontconfig.so'

    integration-commands:
    - |
      if [ -d "%{datadir}/fonts" ]; then
        touch -d @0 "%{datadir}/fonts" /usr/share/fonts/*
        fc-cache -rs
      fi

sources:
- kind: git_tag
  url: freedesktop:fontconfig/fontconfig
  track: master
  ref: f075ca1aeaedbc288d42a70df5cf2fd069ea0d10   #  2.13
- kind: local
  path: files/fontconfig-flatpak.conf
- kind: patch
  path: patches/fontconfig-relocate.patch
- kind: patch
  path: patches/0001-Ensure-cache-checksums-are-determinstic.patch
