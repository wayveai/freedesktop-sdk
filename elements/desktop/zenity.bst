kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: desktop/gtk3.bst
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
  url: tar_https:download.gnome.org/sources/zenity/3.30/zenity-3.30.0.tar.xz
  ref: 995ef696616492c40be6da99919851d41faed6643a97c9d24743b46bc8b537f2
