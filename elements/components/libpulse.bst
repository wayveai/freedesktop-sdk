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

variables:
  meson-local: >-
    -Dasyncns=disabled
    -Davahi=disabled
    -Dbluez5=false
    -Ddatabase=gdbm
    -Dfftw=disabled
    -Dgtk=disabled
    -Djack=disabled
    -Dlirc=disabled
    -Dsoxr=disabled
    -Dsystemd=disabled
    -Dtests=false
    -Dudev=disabled

config:
  install-commands:
    (>):
    - |
      rm "%{install-root}%{bindir}/pulseaudio"
      rm "%{install-root}%{bindir}/start-pulseaudio-x11"
      rm "%{install-root}%{bindir}/pasuspender"
      rm -r "%{install-root}%{libdir}"/pulse-*/modules
      rm -r "%{install-root}%{sysconfdir}/pulse/daemon.conf"
      rm -r "%{install-root}%{sysconfdir}/pulse"/*.pa

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libpulse.so'
        - '%{libdir}/libpulse-simple.so'
        - '%{libdir}/libpulse-mainloop-glib.so'

sources:
- kind: git_tag
  url: freedesktop:pulseaudio/pulseaudio
  track: master
  track-extra:
  - stable-12.x
  exclude:
  - v*.99.*
  ref: v13.0-0-g200618b32f0964a479d69c9b6e5073e6931c370a
