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
  cpe:
    version: '2.13.1'

sources:
- kind: git_tag
  url: freedesktop:fontconfig/fontconfig
  track: master
  ref: 2.13.1-0-g844d8709a1f3ecab45015b24b72dd775c13b2421
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
