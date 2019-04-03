kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/buildsystem-autotools.bst
  type: build
- filename: base/python3.bst
  type: build

variables:
  conf-local: |
    --disable-aload \
    --disable-alisp \
    --disable-old-symbols \
    --with-pythonlibs="-lpthread -lm -ldl -lpython3" \
    --with-pythonincludes=-I/usr/include/python3 \
    --with-pcm-plugins="hw ioplug extplug"

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libasound.so'

sources:
- kind: git_tag
  url: github:alsa-project/alsa-lib.git
  track: master
  ref: v1.1.8-0-gef7b098deb2652cea2659936c96cfe3229c0a782
