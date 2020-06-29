kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/help2man.bst
  type: build
- filename: components/texinfo.bst
  type: build
- filename: components/m4.bst
- filename: components/perl.bst
- filename: components/flex.bst
  type: build

config:
  install-commands:
    (>):
    - |
      rm "%{install-root}%{infodir}/dir"

    - |
      find "%{install-root}" -name "lib*.a" -exec rm {} ";"

sources:
- kind: tar
  url: ftp_gnu_org:bison/bison-3.6.4.tar.gz
  ref: 8183de64b5383f3634942c7b151bf2577f74273b2731574cdda8a8f3a0ab13e9
