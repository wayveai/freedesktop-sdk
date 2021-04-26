kind: autotools

build-depends:
- components/systemd-base.bst
- components/pkg-config.bst

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
    --enable-udev_sync
    --enable-udev_rules
    --with-confdir=%{sysconfdir}
    --with-staticdir=%{sbindir}
    --with-usrlibdir=%{libdir}
    --with-usrsbindir=%{sbindir}

(@):
- elements/include/lvm2-source.yml
