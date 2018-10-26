kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/help2man.bst
  type: build
- filename: base/texinfo.bst
  type: build
- filename: base/m4.bst
- filename: base/perl.bst

config:
  install-commands:
    (>):
    - |
      rm "%{install-root}%{infodir}/dir"

sources:
- kind: tar
  url: ftp_gnu_org:bison/bison-3.0.5.tar.xz
  ref: 075cef2e814642e30e10e8155e93022e4a91ca38a65aa1d5467d4e969f97f338
