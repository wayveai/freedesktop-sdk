kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/git-minimal.bst
- components/m4.bst
- components/perl-xml-parser.bst
- components/systemd.bst

depends:
- bootstrap-import.bst
- components/alsa-lib.bst
- components/dbus.bst
- components/fftw.bst
- components/gdbm.bst
- components/glib.bst
- components/libtool.bst
- components/orc.bst
- components/sndfile.bst
- components/speexdsp.bst
- components/webrtc-audio-processing.bst
- components/xorg-lib-ice.bst
- components/xorg-lib-sm.bst
- components/xorg-lib-xcb.bst
- components/xorg-lib-xtst.bst
- components/gtk3.bst
- components/bluez.bst
- components/sbc.bst

variables:
  meson-local: >-
    -Dasyncns=disabled
    -Davahi=disabled
    -Dbluez5=true
    -Ddatabase=gdbm
    -Dfftw=disabled
    -Dgtk=enabled
    -Djack=disabled
    -Dlirc=disabled
    -Dsoxr=disabled
    -Dsystemd=enabled
    -Dtests=false
    -Dudev=enabled
    -Dudevrulesdir=$(pkg-config --variable=udevdir udev)/rules.d

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
  ref: v13.0-0-g200618b32f0964a479d69c9b6e5073e6931c370a
