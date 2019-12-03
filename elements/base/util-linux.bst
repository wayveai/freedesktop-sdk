kind: autotools
description: util-linux

depends:
- filename: bootstrap-import.bst
- filename: base/buildsystem-autotools.bst
  type: build
- filename: base/bison.bst
  type: build
- filename: base/gettext.bst
  type: build
- filename: base/git-minimal.bst
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
        - '%{libdir}/libfdisk.so'
        - '%{libdir}/libblkid.so'
        - '%{libdir}/libsmartcols.so'
        - '%{libdir}/libmount.so'
        - '%{libdir}/libuuid.so'

config:
  install-commands:
    (>):
    - |
      install -d -m0755 "%{install-root}%{bindir}"
      mv "%{install-root}%{prefix}/sbin"/* "%{install-root}%{bindir}/"
      rm -rf "%{install-root}%{prefix}/sbin"

sources:
- kind: git_tag
  url: kernel:utils/util-linux/util-linux.git
  track: stable/v2.33
  ref: v2.33.2-0-gdf9f1b2ee5bc90fc6f3b0089d2859df1b18f2c74
