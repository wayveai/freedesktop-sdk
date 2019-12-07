kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: desktop/libpulse.bst
- filename: base/buildsystem-autotools.bst
  type: build

variables:
  conf-local: |
    --with-default-audio=pulse \
    --with-audio=pulse

config:
  install-commands:
    (>):
    - |
      rm "%{install-root}%{bindir}"/*

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libout123.so'
        - '%{libdir}/libmpg123.so'

sources:
- kind: tar
  url: tar_https:www.mpg123.de/download/mpg123-1.25.10.tar.bz2
  ref: 6c1337aee2e4bf993299851c70b7db11faec785303cfca3a5c3eb5f329ba7023

