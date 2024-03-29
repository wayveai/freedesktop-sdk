kind: autotools
description: Python 3

build-depends:
- components/bluez-headers.bst
- public-stacks/buildsystem-autotools.bst
- enable-shm.bst

depends:
- bootstrap-import.bst
- components/expat.bst
- components/libffi.bst
- components/gdbm.bst
- components/openssl.bst
- components/sqlite.bst

variables:
  install-conf: MAX_COMPILEALL_JOBS=1  # Used for deterministic compiling
  conf-local: |
    --enable-shared \
    --without-ensurepip \
    --with-system-expat \
    --with-system-ffi \
    --enable-loadable-sqlite-extensions \
    --with-dbmliborder=gdbm \
    --with-lto \
    --with-conf-includedir="%{includedir}/%{gcc_triplet}"
  version_short: "3"
  version_long: "%{version_short}.10"

config:
  install-commands:
  - |
    if [ -n "%{build-dir}" ]; then
    cd %{build-dir}
    fi
    %{make-install} %{install-conf} DESTSHARED=/usr/lib/python%{version_long}/lib-dynload

  - |
    rm -rf %{install-root}%{bindir}/idle*
  - |
    rm -rf %{install-root}%{indep-libdir}/python%{version_long}/idlelib
  - |
    rm -rf %{install-root}%{indep-libdir}/python%{version_long}/tkinter
  - |
    rm -rf %{install-root}%{indep-libdir}/python%{version_long}/turtle*
  - |
    rm -rf %{install-root}%{indep-libdir}/python%{version_long}/__pycache__/turtle.*
  - |
    rm -rf %{install-root}%{indep-libdir}/python%{version_long}/test
  - |
    rm -rf %{install-root}%{indep-libdir}/python%{version_long}/*/test
  - |
    rm -rf %{install-root}%{indep-libdir}/python%{version_long}/*/tests

  - |
    find "%{install-root}" -name "lib*.a" -exec rm {} ";"

  - |
    cat <<EOF >"%{install-root}%{includedir}/python%{version_long}/pyconfig.h"
    #if defined(__x86_64__)
    # include "x86_64-linux-gnu/python%{version_long}/pyconfig.h"
    #elif defined(__i386__)
    # include "i386-linux-gnu/python%{version_long}/pyconfig.h"
    #elif defined(__aarch64__)
    # include "aarch64-linux-gnu/python%{version_long}/pyconfig.h"
    #elif defined(__arm__)
    # include "arm-linux-gnueabihf/python%{version_long}/pyconfig.h"
    #elif defined(__powerpc64__)
    # include "powerpc64le-linux-gnu/python%{version_long}/pyconfig.h"
    #elif defined(__riscv) && (__riscv_xlen == 64)
    # include "riscv64-linux-gnu/python%{version_long}/pyconfig.h"
    #else
    # error "Unknown cross-compiler"
    #endif
    EOF

  - |
    mkdir -p %{install-root}%{bindir}
    ln -s %{bindir}/python%{version_short} %{install-root}%{bindir}/python

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{bindir}/2to3*'
        - '%{bindir}/python%{version_short}-config'
        - '%{bindir}/python%{version_long}-config'
        - '%{libdir}/libpython%{version_long}.so'
        - '%{indep-libdir}/python%{version_long}/config-%{version_long}-%{gcc_triplet}'
        - '%{indep-libdir}/python%{version_long}/config-%{version_long}-%{gcc_triplet}/**'
        - '%{indep-libdir}/python%{version_long}/lib2to3'
        - '%{indep-libdir}/python%{version_long}/lib2to3/**'
  cpe:
    product: python
    patches:
    - CVE-2019-16056

(@):
- elements/include/python3.yml
