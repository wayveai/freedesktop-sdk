kind: filter

build-depends:
- components/pulseaudio-base.bst

runtime-depends:
- bootstrap-import.bst
- components/libdbus.bst
- components/gdbm.bst
- components/glib.bst
- components/libtool.bst
- components/sndfile.bst
- components/xorg-lib-ice.bst
- components/xorg-lib-sm.bst
- components/xorg-lib-xcb.bst
- components/xorg-lib-xtst.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libpulse.so'
        - '%{libdir}/libpulse-simple.so'
        - '%{libdir}/libpulse-mainloop-glib.so'

config:
  include:
  - libpulse
  include-orphans: False

