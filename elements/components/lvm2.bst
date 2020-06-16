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
  ref: v2_02_183-0-gf5ea02ffee3269a77e295d2b186ca81481f592d7
