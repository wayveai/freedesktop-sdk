kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/git-minimal.bst
  type: build
- filename: components/glib.bst
- filename: components/sndfile.bst
- filename: components/speexdsp.bst
- filename: components/dbus.bst
- filename: components/fftw.bst
- filename: components/perl-xml-parser.bst
  type: build
- filename: components/xorg-lib-xcb.bst
- filename: components/xorg-lib-ice.bst
- filename: components/xorg-lib-sm.bst
- filename: components/xorg-lib-xtst.bst
- filename: components/webrtc-audio-processing.bst

variables:
  conf-local: |
    --disable-rpath \
    --with-system-user=pulse \
    --with-system-group=pulse \
    --with-access-group=pulse-access \
    --without-caps \
    --disable-oss-output \
    --disable-jack \
    --disable-lirc \
    --disable-bluez4 \
    --disable-bluez5 \
    --disable-systemd-daemon \
    --disable-systemd-login \
    --disable-systemd-journal \
    --disable-udev

config:
  configure-commands:
    (<):
    - |
      autoreconf -fvi

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
  url: freedesktop:pulseaudio/pulseaudio.git
  track: master
  track-extra:
  - stable-12.x
  exclude:
  - v*.99.*
  ref: v12.2-0-gee910cf6daa5120ab534eb2e6c573d94b9b182e7
- kind: patch
  path: patches/libpulse/pulseaudio-Use-upstream-gettext-instead-intltool.patch
