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
  url: ftp_gnu_org:bison/bison-3.7.6.tar.gz
  ref: 69dc0bb46ea8fc307d4ca1e0b61c8c355eb207d0b0c69f4f8462328e74d7b9ea
