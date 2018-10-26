kind: autotools

depends:
- filename: bootstrap-import.bst
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
- kind: tar
  url: ftp://ftp.alsa-project.org/pub/lib/alsa-lib-1.1.6.tar.bz2
  ref: 5f2cd274b272cae0d0d111e8a9e363f08783329157e8dd68b3de0c096de6d724
