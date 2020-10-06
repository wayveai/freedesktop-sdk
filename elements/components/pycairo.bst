kind: pip

depends:
- filename: components/python3.bst
- filename: components/python3-pip.bst
  type: build
- filename: components/pkg-config.bst
  type: build
- filename: components/cairo.bst

variables:
  pip: pip3

config:
  install-commands:
    (>):
    # setup.py has --pkgconfigdir for command install_pkgconfig. But
    # it is not propagated to the install command so not usable. Also
    # install_pkgconfig depends on --root to be defined, but does not
    # declare it, so calling install_pkgconfig directly does not work.
    # The default guess for the pkgconfig path is wrong.
    # So we have to manually move the installed directory.
    - install -d '%{install-root}%{libdir}/pkgconfig'
    - mv '%{install-root}%{indep-libdir}/pkgconfig' '%{install-root}%{libdir}'

sources:
- kind: git_tag
  url: github:pygobject/pycairo.git
  track: master
  ref: v1.20.0-0-g4783b7eae1fe4eaf2c6b5c950b0c2ea3d25c5f98
