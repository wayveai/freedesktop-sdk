kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/gtk3.bst
- filename: components/itstools.bst
  type: build
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/gettext.bst
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
  url: https://download.gnome.org/sources/zenity/3.30/zenity-3.30.0.tar.xz
  ref: 995ef696616492c40be6da99919851d41faed6643a97c9d24743b46bc8b537f2
