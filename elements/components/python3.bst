kind: autotools
description: Python 3

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/expat.bst
- filename: components/libffi.bst
- filename: components/gdbm.bst
- filename: components/sqlite.bst
- filename: components/xz.bst

variables:
  conf-local: |
    --enable-shared \
    --without-ensurepip \
    --with-system-expat \
    --with-system-ffi \
    --enable-loadable-sqlite-extensions \
    --with-dbmliborder=gdbm \
    --with-lto \
    --with-conf-includedir="%{includedir}/%{gcc_triplet}"

config:
  install-commands:
  - |
    if [ -n "%{builddir}" ]; then
    cd %{builddir}
    fi
    %{make-install} DESTSHARED=/usr/lib/python3.7/lib-dynload

  - |
    rm -rf %{install-root}%{bindir}/idle*
  - |
    rm -rf %{install-root}%{indep-libdir}/python3.7/idlelib
  - |
    rm -rf %{install-root}%{indep-libdir}/python3.7/tkinter
  - |
    rm -rf %{install-root}%{indep-libdir}/python3.7/turtle*
  - |
    rm -rf %{install-root}%{indep-libdir}/python3.7/__pycache__/turtle.*
  - |
    rm -rf %{install-root}%{indep-libdir}/python3.7/test
  - |
    rm -rf %{install-root}%{indep-libdir}/python3.7/*/test
  - |
    rm -rf %{install-root}%{indep-libdir}/python3.7/*/tests

  - |
    rm "%{install-root}%{bindir}/python3.7m"
    ln -s python3.7 "%{install-root}%{bindir}/python3.7m"

  - |
    find "%{install-root}" -name "lib*.a" -exec rm {} ";"

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{bindir}/2to3*'
        - '%{libdir}/libpython3.7m.so'
        - '%{indep-libdir}/python3.7/config-3.7m-%{gcc_triplet}'
        - '%{indep-libdir}/python3.7/config-3.7m-%{gcc_triplet}/**'
        - '%{indep-libdir}/python3.7/lib2to3'
        - '%{indep-libdir}/python3.7/lib2to3/**'
  cpe:
    product: python

sources:
- kind: git_tag
  track: 3.7
  url: github:python/cpython.git
  ref: v3.7.3-0-gef4ec6ed12d6c6200a85068f60483723298b6ff4
- kind: patch
  path: patches/python3/python3-multiarch-include.patch
