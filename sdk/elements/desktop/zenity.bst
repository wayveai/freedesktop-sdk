kind: myautotools

depends:
  - filename: base-stack.bst
  - filename: desktop/gtk3.bst
  - filename: desktop/itstools.bst

variables:
  conf-extra: |
    --disable-webkitgtk

sources:
  - kind: tar
    url: https://download.gnome.org/sources/zenity/3.24/zenity-3.24.0.tar.xz
    ref: 6ff0a026ec94e5bc1b30f78df91e54f4f82fd982f4c29b52fe5dacc886a9f7f7
