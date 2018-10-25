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
  url: https://download.qt.io/official_releases/qt/5.11/5.11.1/submodules/qtbase-everywhere-src-5.11.1.tar.xz
  ref: a0d047b2da5782c8332c59ae203984b64e4d5dc5f4ba9c0884fdbe753d0afb46
