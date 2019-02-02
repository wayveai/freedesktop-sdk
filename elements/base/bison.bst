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
  url: ftp_gnu_org:bison/bison-3.3.1.tar.gz
  ref: 41d5451f854a446f09c4b7e75e1b0201349de7ce140905ac8a4c97efeacfe66b
