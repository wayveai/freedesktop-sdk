kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/libpulse.bst
- filename: public-stacks/buildsystem-autotools.bst
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
        - '%{libdir}/libsyn123.so'

sources:
- kind: tar
  url: tar_https:www.mpg123.de/download/mpg123-1.28.0.tar.bz2
  ref: e49466853685026da5d113dc7ff026b1b2ad0b57d78df693a446add9db88a7d5

