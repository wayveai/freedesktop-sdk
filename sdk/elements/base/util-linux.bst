kind: autotools
description: util-linux

depends:
  - filename: bootstrap-import.bst

variables:
  conf-local: |
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
    url: https://www.kernel.org/pub/linux/utils/util-linux/v2.31/util-linux-2.31.1.tar.xz
    ref: 1a51b16fa9cd51d26ef9ab52d2f1de12403b810fc8252bf7d478df91b3cddf11
