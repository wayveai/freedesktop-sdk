kind: manual

depends:
  - filename: bootstrap-import.bst

variables:
  confdir: "%{install-root}/etc/fonts"

config:
  build-commands:
  - |
    make NAME=google-crosextra-carlito                  \
         PRIO=62                                        \
         EXTRA_CONFS=30-0-google-crosextra-carlito.conf \
         INSTALL_ROOT=%{install-root}

sources:
  - kind: tar
    url:  http://gsdview.appspot.com/chromeos-localmirror/distfiles/crosextrafonts-carlito-20130920.tar.gz
    ref:  4bd12b6cbc321c1cf16da76e2c585c925ce956a08067ae6f6c64eff6ccfdaf5a
  - kind: local
    path: files/font-conf
    
