kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/gtk3.bst
- filename: components/itstool.bst
  type: build
- filename: public-stacks/buildsystem-autotools.bst
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
  url: https://download.gnome.org/sources/zenity/3.32/zenity-3.32.0.tar.xz
  ref: e786e733569c97372c3ef1776e71be7e7599ebe87e11e8ad67dcc2e63a82cd95
