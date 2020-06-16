kind: autotools
description: GNU readline

depends:
- filename: bootstrap/readline-build-deps.bst
  type: build
- filename: bootstrap/ncurses.bst
  type: runtime

(@): elements/bootstrap/include/target.yml

variables:
  conf-local: |
    --with-curses \
    CPPFLAGS="${CPPFLAGS} -I%{sysroot}%{includedir}"

config:
  build-commands:
  - |
    cd "%{builddir}"
    %{make} SHLIB_LIBS="-Wl,--push-state,--no-as-needed -lncursesw -Wl,--pop-state"

  install-commands:
    (>):
      - |
        rm "%{install-root}%{infodir}/dir"

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libreadline.so'
        - '%{libdir}/libhistory.so'

sources:
- kind: tar
  url: ftp_gnu_org:readline/readline-8.0.tar.gz
  ref: e339f51971478d369f8a053a330a190781acb9864cf4c541060f12078948e461
- kind: patch
  path: patches/readline/readline-disable-rpath.patch
