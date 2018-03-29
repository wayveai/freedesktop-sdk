kind: autotools
description: Python 3

depends:
  - filename: bootstrap-import.bst
    type: build
    # glib depends on python
  - filename: base/pkg-config-stage1.bst
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
    LDFLAGS="-L%{libdir}"

config:
  install-commands:
    - |
      if [ -n "%{builddir}" ]; then
      cd %{builddir}
      fi
      %{make-install} DESTSHARED=/usr/lib/python3.6/lib-dynload

public:
  bst:
    split-rules:
      devel:
        (>):
          - "%{bindir}/2to3*"
          - "%{libdir}/libpython3.6m.so"
          - "%{indep-libdir}/python3.6/config-3.6m-%{gcc_triplet}"
          - "%{indep-libdir}/python3.6/config-3.6m-%{gcc_triplet}/**"
          - "%{indep-libdir}/python3.6/lib2to3"
          - "%{indep-libdir}/python3.6/lib2to3/**"
          - "%{indep-libdir}/python3.6/test"
          - "%{indep-libdir}/python3.6/test/**"
          - "%{indep-libdir}/python3.6/*/test"
          - "%{indep-libdir}/python3.6/*/test/**"
          - "%{indep-libdir}/python3.6/*/tests"
          - "%{indep-libdir}/python3.6/*/tests/**"

    integration-commands:
      - test -x "%{prefix}"/bin/python || ln -s python3.6 "%{prefix}"/bin/python
      - test -x "%{prefix}"/bin/python-config || ln -s python3.6-config "%{prefix}"/bin/python-config

sources:
  - kind: tar
    url: https://www.python.org/ftp/python/3.6.3/Python-3.6.3.tar.xz
    ref: cda7d967c9a4bfa52337cdf551bcc5cff026b6ac50a8834e568ce4a794ca81da
