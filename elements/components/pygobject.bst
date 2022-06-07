kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst

depends:
- components/python3.bst
- components/gobject-introspection.bst
- components/libffi.bst
- components/pycairo.bst

sources:
- kind: git_tag
  url: gnome:pygobject.git
  track: master
  track-extra:
  - pygobject-3-42
  ref: 3.42.1-0-g110abf1868c7d4175a3a6944e25b98c957e81db4
