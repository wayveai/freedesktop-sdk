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
  url: ftp_gnu_org:bison/bison-3.4.1.tar.gz
  ref: 7007fc89c216fbfaff5525359b02a7e5b612694df5168c74673f67055f015095
