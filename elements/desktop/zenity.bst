kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: desktop/gtk3.bst
- filename: desktop/wayland-protocols.bst
  type: build
- filename: desktop/itstools.bst
  type: build
- filename: base/buildsystem-autotools.bst
  type: build
- filename: base/gettext.bst
  type: build

variables:
  conf-local: |
    --disable-webkitgtk

config:
  install-commands:
    (>):
    - |
      rm -r "%{install-root}%{datadir}/help"

sources:
- kind: tar
  url: https://download.gnome.org/sources/zenity/3.28/zenity-3.28.1.tar.xz
  ref: db179354721fb4e2d5c418e0dc41f09c831a6b2dd440e33f7743dfc266de8a6b
