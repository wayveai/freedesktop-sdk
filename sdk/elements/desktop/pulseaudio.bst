kind: myautotools

depends:
  - filename: base-stack.bst

variables:
  conf-extra: |
    --disable-rpath \
    --with-system-user=pulse \
    --with-system-group=pulse \
    --with-access-group=pulse-access \
    --disable-oss-output \
    --disable-oss-output \
    --disable-jack \
    --disable-lirc \
    --disable-bluez4 \
    --disable-bluez5 \
    --disable-systemd

sources:
  - kind: tar
    url: https://freedesktop.org/software/pulseaudio/releases/pulseaudio-11.1.tar.xz
    ref: f2521c525a77166189e3cb9169f75c2ee2b82fa3fcf9476024fbc2c3a6c9cd9e
