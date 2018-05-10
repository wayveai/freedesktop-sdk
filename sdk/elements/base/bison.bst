kind: autotools

depends:
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
    url: http://ftp.gnu.org/gnu/bison/bison-3.0.4.tar.xz
    ref: a72428c7917bdf9fa93cb8181c971b6e22834125848cf1d03ce10b1bb0716fe1
