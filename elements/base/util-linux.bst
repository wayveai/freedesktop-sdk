kind: autotools
description: util-linux

depends:
  - filename: bootstrap-import.bst
  - filename: base/autoconf.bst
    type: build
  - filename: base/automake.bst
    type: build
  - filename: base/bison.bst
    type: build
  - filename: base/gettext.bst
    type: build
  - filename: base/libtool.bst
    type: build
  - filename: base/pkg-config.bst
    type: build

variables:
  conf-local: |
    --without-python \
    --disable-wall \
    --disable-makeinstall-chown \
    --disable-kill \
    --enable-usrdir-path

public:
  bst:
    split-rules:
      devel:
        (>):
          - "%{libdir}/libfdisk.so"
          - "%{libdir}/libblkid.so"
          - "%{libdir}/libsmartcols.so"
          - "%{libdir}/libmount.so"
          - "%{libdir}/libuuid.so"

config:
  install-commands:
    (>):
      - |
        install -d -m0755 "%{install-root}%{bindir}"
        mv "%{install-root}%{prefix}/sbin"/* "%{install-root}%{bindir}/"
        rm -rf "%{install-root}%{prefix}/sbin"

sources:
  - kind: git
    url: https://git.kernel.org/pub/scm/utils/util-linux/util-linux.git
    ref: fcee65bcb3372e8878ad80fa4d9f3bda22dcc8d2 # v2.32.1
