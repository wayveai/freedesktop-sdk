kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/freetype.bst
- filename: components/gperf.bst
  type: build
- filename: public-stacks/buildsystem-autotools.bst
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
  url: freedesktop:fontconfig/fontconfig.git
  track: main
  exclude:
  - 2.*.9*
  ref: 2.14.0-0-g911b19f19f1334d51c452756f9ce222c1101097b
- kind: local
  path: files/fontconfig-flatpak.conf
- kind: patch
  path: patches/fontconfig/new-cache-ids-001.patch
- kind: patch
  path: patches/fontconfig/new-cache-ids-002.patch
- kind: patch
  path: patches/fontconfig/new-cache-ids-003.patch
- kind: patch
  path: patches/fontconfig/new-cache-ids-004.patch
- kind: patch
  path: patches/fontconfig/new-cache-ids-005.patch
- kind: patch
  path: patches/fontconfig/new-cache-ids-006.patch
