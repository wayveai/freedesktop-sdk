kind: autotools
description: GNU readline

depends:
- filename: bootstrap/readline-build-deps.bst
  type: build
- filename: bootstrap/ncurses.bst
  type: runtime

(@): elements/bootstrap/target.yml

variables:
  conf-local: |
    --with-curses \
    CPPFLAGS="${CPPFLAGS} -I%{sysroot}%{includedir}"

config:
  build-commands:
  - |
    cd "%{builddir}"
    %{make} SHLIB_LIBS="-Wl,--push-state,--no-as-needed -lncurses -Wl,--pop-state"

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libreadline.so'
        - '%{libdir}/libhistory.so'

sources:
- kind: tar
  url: ftp_gnu_org:readline/readline-7.0.tar.gz
  ref: 750d437185286f40a369e1e4f4764eda932b9459b5ec9a731628393dd3d32334
- kind: patch
  path: patches/readline/readline-disable-rpath.patch
