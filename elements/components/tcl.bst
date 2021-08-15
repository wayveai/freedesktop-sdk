kind: autotools
description: TCL

depends:
- filename: bootstrap-import.bst

variables:
  conf-cmd: ./unix/configure
  conf-local: |
    --disable-rpath

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{indep-libdir}/tcl*/tclAppInit.c'

config:
  install-commands:
    (>):
    - sed -i "s|%{build-root}/%{builddir}|%{includedir}/tcl-private|" %{install-root}%{libdir}/tclConfig.sh
    - sed -i "s|%{build-root}|%{includedir}/tcl-private|" %{install-root}%{libdir}/tclConfig.sh
    - mkdir -p "%{install-root}%{includedir}/tcl-private/doc/"
    - cp "%{build-root}/doc/man.macros" "%{install-root}%{includedir}/tcl-private/doc/"

sources:
- kind: git_tag
  url: github:tcltk/tcl.git
  track: master
  exclude:
  - "*a*"
  - "rc*"
  ref: core-8-6-10-0-gf19d3d1f630f128feddb2728f4c8d222934a38ee
