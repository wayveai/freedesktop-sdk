kind: autotools
description: GNU readline

depends:
- filename: dependencies/base-sdk.bst
  type: build
- filename: dependencies/config.bst
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

variables:
  debugdir: "%{cross-debugdir}"

config:
  configure-commands:
    - |
      ./configure \
      --build=$(sh /config/config.guess) \
      --host=%{triple} \
      --libdir=%{libdir} \
      --disable-static \
      --prefix=%{prefix} \
      --with-curses \
      CPPFLAGS=-I%{sysroot}%{includedir}

  install-commands:
    - |
      %{cross-install}

    - |
      make -j1 install DESTDIR="%{install-root}/readline-separate-install"

sources:
- kind: tar
  url: http://ftp.gnu.org/gnu/readline/readline-7.0.tar.gz
  ref: 750d437185286f40a369e1e4f4764eda932b9459b5ec9a731628393dd3d32334
