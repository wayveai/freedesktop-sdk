kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/git-minimal.bst
- components/perl-xml-parser.bst

depends:
- bootstrap-import.bst
- components/glib.bst
- components/sndfile.bst
- components/speexdsp.bst
- components/dbus.bst
- components/fftw.bst
- components/xorg-lib-xcb.bst
- components/xorg-lib-ice.bst
- components/xorg-lib-sm.bst
- components/xorg-lib-xtst.bst
- components/webrtc-audio-processing.bst
- components/alsa-lib.bst
- components/bluez.bst
- components/sbc.bst

variables:
  conf-local: |
    --disable-rpath \
    --with-system-user=pulse \
    --with-system-group=pulse \
    --with-access-group=pulse-access \
    --with-caps \
    --disable-oss-output \
    --disable-jack \
    --disable-lirc \
    --disable-bluez4 \
    --enable-bluez5 \
    --enable-systemd-daemon \
    --enable-systemd-login \
    --enable-systemd-journal \
    --enable-udev \
    --enable-alsa

config:
  configure-commands:
    (<):
    - |
      autoreconf -fvi

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
  track-extra:
  - stable-12.x
  exclude:
  - v*.99.*
  ref: v12.2-0-gee910cf6daa5120ab534eb2e6c573d94b9b182e7
- kind: patch
  path: patches/libpulse/pulseaudio-Use-upstream-gettext-instead-intltool.patch
- kind: patch
  path: patches/pulseaudio/x11-config-only-ssh.patch
- kind: patch
  path: patches/pulseaudio/alsa-ucm.patch
