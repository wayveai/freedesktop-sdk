kind: autotools
description: GNU ncurses

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
- filename: ncurses-stage1.bst
  type: build
- filename: cross-installation-links.bst
  type: build

variables:
  debugdir: "%{cross-debugdir}"

config:
  configure-commands:
    - |
      mkdir ncurses-build &&
      cd ncurses-build &&
      ../configure \
      --build=$(sh /config/config.guess) \
      --host=%{triple} \
      --libdir=%{libdir} \
      --disable-widec \
      --with-shared \
      --without-ada \
      --without-normal \
      --enable-pc-files \
      --prefix=/usr \
      TIC_PATH=/cross/bin/tic

    - |
      mkdir ncursesw-build &&
      cd ncursesw-build &&
      ../configure \
      --build=$(sh /config/config.guess) \
      --host=%{triple} \
      --libdir=%{libdir} \
      --enable-widec \
      --with-shared \
      --without-ada \
      --without-normal \
      --enable-pc-files \
      --prefix=/usr \
      TIC_PATH=/cross/bin/tic

  build-commands:
    - |
      cd ncurses-build && %{make}

    - |
      cd ncursesw-build && %{make}

  install-commands:
    - |
      cd ncurses-build && %{cross-install}

    - |
      cd ncursesw-build && %{cross-install}

    - |
      cd ncurses-build && make -j1 install DESTDIR="%{install-root}/readline-separate-install"

sources:
- kind: tar
  url: http://ftp.gnu.org/gnu/ncurses/ncurses-6.0.tar.gz
  ref: f551c24b30ce8bfb6e96d9f59b42fbea30fa3a6123384172f9e7284bcf647260
