kind: myautotools

depends:
  - filename: base.bst
    type: build
  - filename: desktop/gtk3.bst

variables:
  conf-extra: |
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
    --disable-tests

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
        - "%{libdir}/libibus-1.0.so"

sources:
  - kind: tar
    url: https://github.com/ibus/ibus/releases/download/1.5.17/ibus-1.5.17.tar.gz
    ref: 0347a8055977ca458e8add750af5f9b76e1a524844cc3b0e2fad70ce153dd219
