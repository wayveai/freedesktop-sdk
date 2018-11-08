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
  url: https://download.qt.io/official_releases/qt/5.11/5.11.2/submodules/qtbase-everywhere-src-5.11.2.tar.xz
  ref: 6381e7c3468d5a1dcfe3683b29eeced192faa0f8a32434fec071a59b8bcd0107
