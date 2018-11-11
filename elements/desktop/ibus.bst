kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: desktop/gobject-introspection.bst
  type: build
- filename: desktop/gtk3.bst
- filename: desktop/wayland-protocols.bst
  type: build
- filename: base/intltool.bst
  type: build
- filename: base/buildsystem-autotools.bst
  type: build
- filename: base/iso-codes.bst
  type: build

variables:
  conf-local: |
    --disable-xim \
    --disable-dconf \
    --disable-gconf \
    --disable-memconf \
    --disable-schemas-compile \
    --disable-schemas-install \
    --disable-gtk2 \
    --disable-setup \
    --disable-ui \
    --disable-engine \
    --disable-python-library \
    --disable-libnotify \
    --disable-emoji-dict \
    --disable-appindicator \
    --disable-glibtest \
    --disable-tests \
    --disable-unicode-dict

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
  url: github:ibus/ibus/releases/download/1.5.19/ibus-1.5.19.tar.gz
  ref: 4b66c798dab093f0fa738e5c10688d395a463287d13678c208a81051af5d2429
