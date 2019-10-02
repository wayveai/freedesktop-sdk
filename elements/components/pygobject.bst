kind: distutils

depends:
- filename: components/python3.bst
- filename: components/python3-setuptools.bst
- filename: components/gobject-introspection.bst
- filename: components/pkg-config.bst
  type: build
- filename: components/python3-wheel.bst

- filename: components/pycairo.bst
  type: build

config:
  install-commands:
    (>):
    - |
      mkdir -p "%{install-root}%{libdir}"
      mv "%{install-root}%{indep-libdir}/pkgconfig" "%{install-root}%{libdir}/"

sources:
- kind: git_tag
  url: gnome:pygobject.git
  track: pygobject-3-32
  ref: 3.32.2-0-g16cc7953d7704db76f78304cfeee45556fc999d7
