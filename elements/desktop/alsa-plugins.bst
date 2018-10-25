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
      mv "%{install-root}%{datadir}/alsa/alsa.conf.d/99-pulseaudio-default.conf.example" "%{install-root}%{datadir}/alsa/alsa.conf.d/99-pulseaudio-default.conf"

sources:
- kind: tar
  url: ftp://ftp.alsa-project.org/pub/plugins/alsa-plugins-1.1.6.tar.bz2
  ref: 6f1d31ebe3b1fa1cc8dade60b7bed1cb2583ac998167002d350dc0a5e3e40c13
