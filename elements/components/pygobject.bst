kind: distutils

build-depends:
- components/python3-setuptools.bst
- components/python3-wheel.bst
- components/pycairo.bst
- components/pkg-config.bst

depends:
- components/python3.bst
- components/gobject-introspection.bst

config:
  install-commands:
    (>):
    - |
      mkdir -p "%{install-root}%{libdir}"
      mv "%{install-root}%{indep-libdir}/pkgconfig" "%{install-root}%{libdir}/"

sources:
- kind: git_tag
  url: gnome:pygobject.git
  track: master
  track-extra:
  - pygobject-3-40
  ref: 3.42.0-0-gd612f3cc675a1838bc5a18061df040ab6405fd31
