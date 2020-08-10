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
  ref: v2_03_10-0-g4d9f0606beb0acb329794909560433c08b50875d
