kind: autotools

depends:
- bootstrap-import.bst
- components/libaio.bst

variables:
  conf-local: >-
    --enable-dmeventd
    --enable-cmdlib
    --enable-pkgconfig
    --with-confdir=%{sysconfdir}
    --with-staticdir=%{sbindir}
    --with-usrlibdir=%{libdir}
    --with-usrsbindir=%{sbindir}

sources:
- kind: git_tag
  url: sourceware:lvm2.git
  track: master
  ref: v2_03_09-0-ge1c2b4126520f05a5d2d515121e89263ec45a2bf
