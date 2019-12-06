kind: manual

# qmake is only available in qt-base, but is built at configure time

depends:
- filename: bootstrap-import.bst
- filename: base/perl.bst
  type: build
- filename: base/pkg-config.bst
  type: build
- filename: base/python3.bst
  type: build
- filename: base/which.bst
  type: build

variables:
  conf-local: |
    -prefix %{prefix} \
    -libdir %{libdir} \
    -no-gui \
    -no-widgets \
    -no-dbus \
    -nomake tests \
    -nomake examples \
    -confirm-license \
    -opensource \
    -platform linux-g++ \
    -accessibility \
    -no-pch \
    -no-rpath \
    -no-directfb \
    -no-linuxfb \
    -no-kms \
    -no-cups \
    -system-proxies

config:
  build-commands:
  - ./configure %{conf-local}

  install-commands:
  - |
    mkdir "%{install-root}%{prefix}"
    mkdir "%{install-root}%{bindir}"
    mv bin/qmake "%{install-root}%{bindir}" 

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/*.so'

sources:
- kind: tar
  url: tar_https:download.qt.io/official_releases/qt/5.12/5.12.1/submodules/qtbase-everywhere-src-5.12.1.tar.xz
  ref: 533078ce02678988576e224cb3844979907950cf83e0fda3364bc1d5701c9049
