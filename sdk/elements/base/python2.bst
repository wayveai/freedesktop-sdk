kind: myautotools
description: Python 2

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
    (>):
      - |
        ln -s "../%{gcc_triplet}/python2.7/lib-dynload" "%{install-root}/usr/lib/python2.7/lib-dynload"
        rm -f "%{install-root}%{bindir}/2to3"

      - |
        install -m 0755 python2-usercustomize.py %{install-root}%{indep-libdir}/python2.7/usercustomize.py

public:
  bst:
    split-rules:
      devel:
        (>):
          - "%{libdir}/libpython2.7.so"

    integration-commands:
      - |
        python2 -m compileall "%{indep-libdir}/python2.7/usercustomize.py"
        python2 -O -m compileall "%{indep-libdir}/python2.7/usercustomize.py"
        python2 -OO -m compileall "%{indep-libdir}/python2.7/usercustomize.py"

sources:
  - kind: tar
    url: https://www.python.org/ftp/python/2.7.14/Python-2.7.14.tar.xz
    ref: 71ffb26e09e78650e424929b2b457b9c912ac216576e6bd9e7d204ed03296a66
  - kind: local
    path: elements/base/python2-usercustomize.py
