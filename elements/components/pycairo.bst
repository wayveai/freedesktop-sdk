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
- kind: pypi
  name: pycairo
  url: pypi:e8/9d/c8be300fc6b1298559d37a071c3833b0b251e0fff334d2e4c408d5789162/pycairo-1.19.1.tar.gz
  sha256sum: 2c143183280feb67f5beb4e543fd49990c28e7df427301ede04fc550d3562e84
