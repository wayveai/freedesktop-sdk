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

  - |
    cat <<EOF >"%{install-root}%{includedir}/python3.7m/pyconfig.h"
    #if defined(__x86_64__)
    # include "x86_64-linux-gnu/python3.7m/pyconfig.h"
    #elif defined(__i386__)
    # include "i386-linux-gnu/python3.7m/pyconfig.h"
    #elif defined(__aarch64__)
    # include "aarch64-linux-gnu/python3.7m/pyconfig.h"
    #elif defined(__arm__)
    # include "arm-linux-gnueabihf/python3.7m/pyconfig.h"
    #elif defined(__powerpc64__)
    # include "powerpc64le-linux-gnu/python3.7m/pyconfig.h"
    #else
    # error "Unknown cross-compiler"
    #endif
    EOF

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{bindir}/2to3*'
        - '%{bindir}/python3-config'
        - '%{bindir}/python3.7-config'
        - '%{bindir}/python3.7m-config'
        - '%{libdir}/libpython3.7m.so'
        - '%{indep-libdir}/python3.7/config-3.7m-%{gcc_triplet}'
        - '%{indep-libdir}/python3.7/config-3.7m-%{gcc_triplet}/**'
        - '%{indep-libdir}/python3.7/lib2to3'
        - '%{indep-libdir}/python3.7/lib2to3/**'
  cpe:
    product: python
    patches:
    - CVE-2019-16056

sources:
- kind: git_tag
  track: '3.7'
  exclude:
  - v*rc*
  url: github:python/cpython.git
  ref: v3.7.4-0-ge09359112e250268eca209355abeb17abf822486
- kind: patch
  path: patches/python3/python3-multiarch-include.patch
- kind: patch
  path: patches/python3/CVE-2019-16056.patch
