kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/buildsystem-autotools.bst
  type: build
- filename: base/glib.bst
- filename: base/intltool.bst
  type: build
- filename: base/sndfile.bst
- filename: base/speexdsp.bst
- filename: desktop/dbus.bst
- filename: desktop/fftw.bst
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
    --disable-systemd-daemon \
    --disable-systemd-login \
    --disable-systemd-journal

config:
  configure-commands:
    (<):
    - |
      AUTOPOINT='intltoolize --automake --copy' autoreconf -fvi

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
- kind: tar
  url: tar_https:freedesktop.org/software/pulseaudio/releases/pulseaudio-12.2.tar.gz
  ref: 67d1531576231e98d24bc307e980237bdca5142bda8920af89e6e6e887cb90ec
