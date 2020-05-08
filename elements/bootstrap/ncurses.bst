kind: autotools
description: GNU ncurses

depends:
- filename: bootstrap/ncurses-build-deps.bst
  type: build
- filename: bootstrap/glibc.bst
  type: runtime

(@):
- elements/bootstrap/include/target.yml
- elements/bootstrap/include/ncurses-sources.yml

config:
  configure-commands:
  - |
    mkdir ncurses-build &&
    cd ncurses-build &&
    ../configure \
    --build=%{bootstrapper-triplet} \
    --host=%{triplet} \
    --disable-stripping \
    --libdir=%{libdir} \
    --with-pkg-config-libdir="%{libdir}/pkgconfig" \
    --disable-widec \
    --with-shared \
    --without-ada \
    --without-normal \
    --enable-pc-files \
    --with-termlib \
    --prefix=/usr \
    --disable-stripping \
    TIC_PATH="%{tools}/bin/tic"

  - |
    mkdir ncursesw-build &&
    cd ncursesw-build &&
    ../configure \
    --build=%{bootstrapper-triplet} \
    --host=%{triplet} \
    --disable-stripping \
    --libdir=%{libdir} \
    --with-pkg-config-libdir="%{libdir}/pkgconfig" \
    --enable-widec \
    --with-shared \
    --without-ada \
    --without-normal \
    --enable-pc-files \
    --with-termlib \
    --prefix=/usr \
    --disable-stripping \
    TIC_PATH="%{tools}/bin/tic"

  build-commands:
  - |
    cd ncurses-build && %{make}

  - |
    cd ncursesw-build && %{make}

  install-commands:
  - |
    cd ncurses-build && %{make-install}

  - |
    cd ncursesw-build && %{make-install}

  - |
    mkdir -p "%{install-root}%{includedir}/%{gcc_triplet}"
    mv "%{install-root}%{includedir}/curses.h" "%{install-root}%{includedir}/%{gcc_triplet}/"
    mv "%{install-root}%{includedir}/ncurses.h" "%{install-root}%{includedir}/%{gcc_triplet}/"

  - |
    find "%{install-root}" -name "lib*.a" -exec rm {} ";"

  - |
    %{delete_libtool_files}

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{bindir}/ncurses6-config'
        - '%{bindir}/ncursesw6-config'
        - '%{libdir}/libtinfo.so'
        - '%{libdir}/libtinfow.so'
        - '%{libdir}/libformw.so'
        - '%{libdir}/libform.so'
        - '%{libdir}/libpanel.so'
        - '%{libdir}/libmenuw.so'
        - '%{libdir}/libmenu.so'
        - '%{libdir}/libcurses.so'
        - '%{libdir}/libncursesw.so'
        - '%{libdir}/libncurses.so'
        - '%{libdir}/libpanelw.so'
