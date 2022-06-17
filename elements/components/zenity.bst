kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/itstool.bst

depends:
- components/gtk3.bst

variables:
  meson-local: >-
    -Dlibnotify=false
    -Dwebkitgtk=false

config:
  install-commands:
    (>):
    - |
      rm -r "%{install-root}%{datadir}/help"

sources:
- kind: tar
  url: tar_https:download.gnome.org/sources/zenity/3.42/zenity-3.42.1.tar.xz
  ref: a08e0c8e626615ee2c23ff74628eba6f8b486875dd54371ca7e2d7605b72a87c
