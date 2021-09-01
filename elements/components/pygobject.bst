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
  ref: 3.40.1-0-g8f0b2bbea727280b055317bb401213c5156af318
