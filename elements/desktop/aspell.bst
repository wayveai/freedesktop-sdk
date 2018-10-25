kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/perl.bst
  type: build
- filename: base/texinfo.bst
  type: build

variables:
  builddir: ''
  conf-local: |
    --enable-curses="-ltinfow -lncursesw"

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libaspell.so'
        - '%{libdir}/libpspell.so'

config:
  install-commands:
    (>):
    - |
      rm "%{install-root}%{infodir}/dir"

sources:
- kind: tar
  url: ftp_gnu_org:aspell/aspell-0.60.6.1.tar.gz
  ref: f52583a83a63633701c5f71db3dc40aab87b7f76b29723aeb27941eff42df6e1
- kind: patch
  path: patches/aspell-compile-fix.patch
