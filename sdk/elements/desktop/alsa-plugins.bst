kind: myautotools

depends:
  - filename: base.bst
    type: build
  - filename: desktop/alsa-lib.bst
  - filename: desktop/pulseaudio.bst

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
    url: ftp://ftp.alsa-project.org/pub/plugins/alsa-plugins-1.1.4.tar.bz2
    ref: 530d1c3bdaeb058f2a03607a33b9e16ee5369bfd30a96bc09bd2c69b4ddd1a8a
