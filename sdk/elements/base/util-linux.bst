kind: autotools
description: util-linux

depends:
  - filename: bootstrap-import.bst

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
  - kind: tar
    url: https://www.kernel.org/pub/linux/utils/util-linux/v2.32/util-linux-2.32.1.tar.xz
    ref: 86e6707a379c7ff5489c218cfaf1e3464b0b95acf7817db0bc5f179e356a67b2
