kind: meson

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-meson.bst
  type: build
- filename: components/alsa-lib.bst
- filename: components/dbus.bst
- filename: components/fftw.bst
- filename: components/gdbm.bst
- filename: components/git-minimal.bst
  type: build
- filename: components/glib.bst
- filename: components/libtool.bst
- filename: components/m4.bst
  type: build
- filename: components/orc.bst
- filename: components/perl-xml-parser.bst
  type: build
- filename: components/sndfile.bst
- filename: components/speexdsp.bst
- filename: components/webrtc-audio-processing.bst
- filename: components/xorg-lib-ice.bst
- filename: components/xorg-lib-sm.bst
- filename: components/xorg-lib-xcb.bst
- filename: components/xorg-lib-xtst.bst
- filename: components/gtk3.bst

variables:
  meson-local: >-
    -Dasyncns=disabled
    -Davahi=disabled
    -Dbluez5=false
    -Ddatabase=gdbm
    -Dfftw=disabled
    -Dgtk=enabled
    -Djack=disabled
    -Dlirc=disabled
    -Dsoxr=disabled
    -Dsystemd=enabled
    -Dtests=false
    -Dudev=enabled

public:
  bst:
    split-rules:
      libpulse:
      - '%{debugdir}/**'
      - '%{includedir}/**'
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
