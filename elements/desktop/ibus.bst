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
    --disable-schemas-compile \
    --disable-gtk2 \
    --disable-setup \
    --disable-ui \
    --disable-engine \
    --disable-libnotify \
    --disable-emoji-dict \
    --disable-appindicator \
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
  url: https://github.com/ibus/ibus/releases/download/1.5.18/ibus-1.5.18.tar.gz
  ref: 8551f7d027fb65d48225642fc8f3b232412ea75a4eb375244dd72a4d73c2639e
