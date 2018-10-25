kind: autotools
description: GNU readline

depends:
- filename: dependencies/base-sdk.bst
  type: build
- filename: gnu-config.bst
  type: build
- filename: linux-headers.bst
  type: build
- filename: gcc-stage2.bst
  type: build
- filename: binutils-stage1.bst
  type: build
- filename: glibc.bst
  type: build
- filename: ncurses.bst
  type: build
- filename: cross-installation-links.bst
  type: build
- filename: debugedit-host.bst
  type: build

variables:
  build-triplet: '%{guessed-triplet}'
  host-triplet: '%{triplet}'

  conf-local: |
    --with-curses \
    CPPFLAGS="${CPPFLAGS} -I%{sysroot}%{includedir}"

config:
  build-commands:
  - |
    cd "%{builddir}"
    %{make} SHLIB_LIBS=-lncurses

  install-commands:
  - |
    cd "%{builddir}"
    %{cross-install}

  - |
    cd "%{builddir}"
    make -j1 install DESTDIR="%{install-root}/readline-separate-install"

  - |
    %{delete_libtool_files}

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{sysroot}%{libdir}/libreadline.so'
        - '%{sysroot}%{libdir}/libhistory.so'

sources:
- kind: tar
  url: ftp_gnu_org:readline/readline-7.0.tar.gz
  ref: 750d437185286f40a369e1e4f4764eda932b9459b5ec9a731628393dd3d32334
- kind: patch
  path: patches/readline-disable-rpath.patch
