kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/alsa-lib.bst
- filename: components/libpulse.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build

variables:
  conf-local: |
    --disable-jack \
    --enable-pulseaudio \
    --disable-samplerate \
    --disable-libav \
    --with-speex=no

config:
  install-commands:
    (>):
    - |
      mv "%{install-root}%{sysconfdir}/alsa/conf.d/99-pulseaudio-default.conf.example" "%{install-root}%{sysconfdir}/alsa/conf.d/99-pulseaudio-default.conf"

sources:
- kind: git_tag
  url: github:alsa-project/alsa-plugins.git
  track: master
  ref: v1.2.5-0-gb9bbda8724b3417e59389e628610e114a6fd4300
