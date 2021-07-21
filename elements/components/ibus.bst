kind: autotools

build-depends:
- components/gobject-introspection.bst
- components/wayland-protocols.bst
- public-stacks/buildsystem-autotools.bst
- components/iso-codes.bst

depends:
- filename: components/gtk3.bst

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
      rm -r "%{install-root}%{datadir}/gettext"
      rm -r "%{install-root}%{datadir}/locale"
      rm -r "%{install-root}%{libexecdir}"

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libibus-1.0.so'

sources:
- kind: tar
  url: github_files:ibus/ibus/releases/download/1.5.24/ibus-1.5.24.tar.gz
  ref: abf33a965063629d3bbdab8a5948736ce3a9523cc3d6331e5ea0ec5e8ea7421f
