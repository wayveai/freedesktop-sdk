kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: desktop/alsa-lib.bst
- filename: desktop/libpulse.bst
- filename: base/buildsystem-autotools.bst
  type: build

variables:
  conf-local: |
    --disable-jack \
    --enable-pulseaudio \
    --disable-samplerate \
    --disable-avcodec \
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
  ref: v1.1.8-0-ge0e8031ab2675beb05aab5c82442ae7bc7a00545
