kind: autotools
description: Python 2

depends:
- filename: bootstrap-import.bst
- filename: base/buildsystem-autotools.bst
  type: build
- filename: base/expat.bst
- filename: base/libffi.bst
- filename: base/gdbm.bst
- filename: base/openssl.bst
- filename: base/sqlite.bst
- filename: base/xz.bst

variables:
  conf-local: |
    --enable-shared \
    --with-ensurepip=yes \
    --with-system-expat \
    --with-system-ffi \
    --enable-loadable-sqlite-extensions \
    --with-dbmliborder=gdbm \
    --enable-unicode=ucs4

public:
  bst:
    split-rules:
      devel:
        (>):
        - '**'
  cpe:
    product: python

config:
  install-commands:
  - |
    if [ -n "%{builddir}" ]; then
      cd %{builddir}
    fi
    %{make-install} DESTSHARED=/usr/lib/python2.7/lib-dynload

  - |
    rm -f "%{install-root}%{bindir}/2to3"
  - |
    rm -rf %{install-root}%{indep-libdir}/python2.7/lib2to3
  - |
    rm -rf %{install-root}%{bindir}/idle*
  - |
    rm -rf %{install-root}%{indep-libdir}/python2.7/idlelib
  - |
    rm -rf %{install-root}%{indep-libdir}/python2.7/lib-tk
  - |
    rm -rf %{install-root}%{indep-libdir}/python2.7/test
  - |
    rm -rf %{install-root}%{indep-libdir}/python2.7/*/test
  - |
    rm -rf %{install-root}%{indep-libdir}/python2.7/*/tests

  - |
    %{fix-pyc-timestamps}

sources:
- kind: tar
  url: https://www.python.org/ftp/python/2.7.16/Python-2.7.16.tar.xz
  ref: f222ef602647eecb6853681156d32de4450a2c39f4de93bd5b20235f2e660ed7
