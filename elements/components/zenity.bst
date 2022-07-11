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
- kind: git_tag
  url: gnome:zenity.git
  track: master
  ref: 3.43.0-0-g01e6d92f23f49414ba8ec4c5b3daf49222c1e31d
