kind: autotools

depends:
  - filename: bootstrap-import.bst
  - filename: base/python2.bst
    type: build

variables:
  conf-local: |
    --disable-aload \
    --disable-alisp \
    --disable-old-symbols \
    --with-pythonlibs="-lpthread -lm -ldl -lpython2.7" \
    --with-pythonincludes=-I/usr/include/python2.7 \
    --with-pcm-plugins="hw ioplug extplug"

public:
  bst:
    split-rules:
      devel:
        (>):
          - "%{libdir}/libasound.so"

sources:
  - kind: tar
    url: ftp://ftp.alsa-project.org/pub/lib/alsa-lib-1.1.4.1.tar.bz2
    ref: 91bb870c14d1c7c269213285eeed874fa3d28112077db061a3af8010d0885b76
