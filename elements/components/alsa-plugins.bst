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
  ref: v1.2.2-0-g7028580da1db9a2362dd9b0631d7f667b373c313
