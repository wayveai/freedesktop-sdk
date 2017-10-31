kind: myautotools

depends:
  - filename: base-stack.bst

variables:
  conf-extra: |
    --disable-aload \
    --disable-alisp \
    --disable-old-symbols \
    --with-pcm-plugins="hw ioplug extplug"

sources:
  - kind: tar
    url: ftp://ftp.alsa-project.org/pub/lib/alsa-lib-1.1.4.1.tar.bz2
    ref: 91bb870c14d1c7c269213285eeed874fa3d28112077db061a3af8010d0885b76
