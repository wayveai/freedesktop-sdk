kind: autotools

depends:
  - filename: base.bst
    type: build
  - filename: desktop/gtk3.bst
  - filename: desktop/wayland-protocols.bst
    type: build
  - filename: desktop/itstools.bst

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
    url: https://download.gnome.org/sources/zenity/3.26/zenity-3.26.0.tar.xz
    ref: 6a7f34626dd62b751fe22bcdb32f3558f8a8fdddcc9406893dd264f0ac18e830
