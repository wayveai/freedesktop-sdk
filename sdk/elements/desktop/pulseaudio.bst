kind: autotools

depends:
  - filename: bootstrap-import.bst
  - filename: base/autoconf-archive.bst
    type: build
  - filename: base/automake.bst
    type: build
  - filename: base/glib.bst
  - filename: base/intltool.bst
    type: build
  - filename: base/libtool.bst
    type: build
  - filename: base/pkg-config.bst
    type: build
  - filename: base/sndfile.bst
  - filename: base/speexdsp.bst
  - filename: desktop/dbus.bst
  - filename: desktop/xorg-lib-xcb.bst
  - filename: desktop/xorg-lib-ice.bst
  - filename: desktop/xorg-lib-sm.bst
  - filename: desktop/xorg-lib-xtst.bst

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
    --disable-systemd

config:
  configure-commands:
    (<):
      - |
        AUTOPOINT='intltoolize --automake --copy' autoreconf -fvi

  install-commands:
    (>):
      - |
          rm -r "%{install-root}%{datadir}/pulseaudio"
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
          - "%{libdir}/libpulse.so"
          - "%{libdir}/libpulse-simple.so"
          - "%{libdir}/libpulse-mainloop-glib.so"

sources:
  - kind: tar
    url: https://freedesktop.org/software/pulseaudio/releases/pulseaudio-11.1.tar.xz
    ref: f2521c525a77166189e3cb9169f75c2ee2b82fa3fcf9476024fbc2c3a6c9cd9e
  - kind: patch
    path: patches/pulseaudio-glibc-2.27.patch
