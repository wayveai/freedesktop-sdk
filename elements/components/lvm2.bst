kind: autotools

build-depends:
- components/systemd-lvm2-stage1.bst

depends:
- bootstrap-import.bst
- components/libaio.bst

runtime-depends:
- components/systemd-libs.bst

variables:
  conf-local: >-
    --enable-dmeventd
    --enable-cmdlib
    --enable-pkgconfig
    --with-confdir=%{sysconfdir}
    --with-staticdir=%{sbindir}
    --with-usrlibdir=%{libdir}
    --with-usrsbindir=%{sbindir}

(@):
- elements/include/lvm2-source.yml
