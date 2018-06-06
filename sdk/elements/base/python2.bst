kind: autotools
description: Python 2

depends:
  - filename: bootstrap-import.bst
    # glib depends on python
  - filename: base/pkg-config.bst
    type: build
  - filename: base/expat.bst
  - filename: base/libffi.bst
  - filename: base/gdbm.bst
  - filename: base/openssl.bst
  - filename: base/sqlite.bst
  - filename: base/xz.bst
  - filename: base/bzip2.bst

variables:
  # We need to install pip separatly to avoid conflict with setuptools
  conf-local: |
    --enable-shared \
    --without-ensurepip \
    --with-system-expat \
    --with-system-ffi \
    --enable-loadable-sqlite-extensions \
    --with-dbmliborder=gdbm \
    --enable-unicode=ucs4 \
    LDFLAGS="-L%{libdir}"

public:
  bst:
    split-rules:
      devel:
        (>):
          - "**"

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
    url: https://www.python.org/ftp/python/2.7.14/Python-2.7.14.tar.xz
    ref: 71ffb26e09e78650e424929b2b457b9c912ac216576e6bd9e7d204ed03296a66
