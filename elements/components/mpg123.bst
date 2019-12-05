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

sources:
- kind: tar
  url: tar_https:www.mpg123.de/download/mpg123-1.25.11.tar.bz2
  ref: df063307faa27c7d9efe63d2139b1564cfc7cdbb7c6f449c89ef8faabfa0eab2

