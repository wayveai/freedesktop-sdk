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

    - |
      find "%{install-root}" -name "lib*.a" -exec rm {} ";"


sources:
- kind: tar
  url: ftp_gnu_org:bison/bison-3.3.2.tar.gz
  ref: 0fda1d034185397430eb7b0c9e140fb37e02fbfc53b90252fa5575e382b6dbd1
