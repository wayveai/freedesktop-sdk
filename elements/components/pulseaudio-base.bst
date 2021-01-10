kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/m4.bst
- components/perl-xml-parser.bst
- components/systemd.bst

depends:
- bootstrap-import.bst
- components/dbus.bst
- components/gdbm.bst
- components/glib.bst
- components/libtool.bst
- components/sndfile.bst
- components/xorg-lib-ice.bst
- components/xorg-lib-sm.bst
- components/xorg-lib-xcb.bst
- components/xorg-lib-xtst.bst

variables:
  meson-local: >-
    -Dalsa=disabled
    -Dasyncns=disabled
    -Davahi=disabled
    -Dbluez5=false
    -Ddatabase=gdbm
    -Dfftw=disabled
    -Dgtk=disabled
    -Djack=disabled
    -Dlirc=disabled
    -Dorc=disabled
    -Dsoxr=disabled
    -Dspeex=disabled
    -Dsystemd=enabled
    -Dtests=false
    -Dudev=disabled
    -Dudevrulesdir=$(pkg-config --variable=udevdir udev)/rules.d
    -Dwebrtc-aec=disabled

public:
  bst:
    split-rules:
      libpulse:
      - '%{debugdir}/**'
      - '%{includedir}/**'
      - '%{libdir}/cmake/**'
      - '%{libdir}/pkgconfig/**'
      - '%{libdir}/pulseaudio/lib*.so*'
      - '%{libdir}/lib*.so*'
      - '%{bindir}/pacat'
      - '%{bindir}/pacmd'
      - '%{bindir}/pactl'
      - '%{bindir}/padsp'
      - '%{bindir}/pa-info'
      - '%{bindir}/pamon'
      - '%{bindir}/paplay'
      - '%{bindir}/parec'
      - '%{bindir}/parecord'
      - '%{bindir}/pax11publish'
      - '%{sysconfdir}/pulse/client.conf'

sources:
- kind: git_tag
  url: freedesktop:pulseaudio/pulseaudio.git
  track: master
  #track-extra:
  #- stable-13.x
  exclude:
  - v*.99.*
  ref: v14.0-0-gd1e0594e939e3309435c966d994b0207b10f5175
