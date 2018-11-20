kind: autotools
description: GNU ncurses

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
- filename: ncurses-stage1.bst
  type: build
- filename: cross-installation-links.bst
  type: build
- filename: debugedit-host.bst
  type: build

(@): target.yml

config:
  configure-commands:
  - |
    mkdir ncurses-build &&
    cd ncurses-build &&
    ../configure \
    --build=%{guessed-triplet} \
    --host=%{triplet} \
    --libdir=%{libdir} \
    --with-pkg-config-libdir="%{libdir}/pkgconfig" \
    --disable-widec \
    --with-shared \
    --without-ada \
    --without-normal \
    --enable-pc-files \
    --with-termlib \
    --prefix=/usr \
    TIC_PATH="%{tools}/bin/tic"

  - |
    mkdir ncursesw-build &&
    cd ncursesw-build &&
    ../configure \
    --build=%{guessed-triplet} \
    --host=%{triplet} \
    --libdir=%{libdir} \
    --with-pkg-config-libdir="%{libdir}/pkgconfig" \
    --enable-widec \
    --with-shared \
    --without-ada \
    --without-normal \
    --enable-pc-files \
    --with-termlib \
    --prefix=/usr \
    TIC_PATH="%{tools}/bin/tic"

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

  - |
    %{delete_libtool_files}

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{sysroot}%{libdir}/libtinfo.so'
        - '%{sysroot}%{libdir}/libtinfow.so'
        - '%{sysroot}%{libdir}/libformw.so'
        - '%{sysroot}%{libdir}/libform.so'
        - '%{sysroot}%{libdir}/libpanel.so'
        - '%{sysroot}%{libdir}/libmenuw.so'
        - '%{sysroot}%{libdir}/libmenu.so'
        - '%{sysroot}%{libdir}/libcurses.so'
        - '%{sysroot}%{libdir}/libncursesw.so'
        - '%{sysroot}%{libdir}/libncurses.so'
        - '%{sysroot}%{libdir}/libpanelw.so'

sources:
- kind: tar
  url: ftp_gnu_org:ncurses/ncurses-6.1.tar.gz
  ref: aa057eeeb4a14d470101eff4597d5833dcef5965331be3528c08d99cebaa0d17
