kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/gobject-introspection.bst
  type: build
- filename: components/gtk3.bst
- filename: components/wayland-protocols.bst
  type: build
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/iso-codes.bst
  type: build

variables:
  conf-local: |
    --disable-xim \
    --disable-dconf \
    --disable-memconf \
    --disable-schemas-compile \
    --disable-gtk2 \
    --disable-setup \
    --disable-ui \
    --disable-engine \
    --disable-python-library \
    --disable-emoji-dict \
    --disable-appindicator \
    --disable-glibtest \
    --disable-tests \
    --disable-unicode-dict \
    --disable-python2

config:
  install-commands:
    (>):
    - |
      rm -r "%{install-root}%{bindir}"
      rm -r "%{install-root}%{datadir}/bash-completion"
      rm -r "%{install-root}%{datadir}/dbus-1"
      rm -r "%{install-root}%{datadir}/icons"
      rm -r "%{install-root}%{datadir}/man"
      rm -r "%{install-root}%{datadir}/ibus"

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libibus-1.0.so'

sources:
- kind: tar
  url: github:ibus/ibus/releases/download/1.5.21/ibus-1.5.21.tar.gz
  ref: adc1e5e620d6a89a49306f022b50561f2c05218dec13d0c9b136dc8b6568a2b9
