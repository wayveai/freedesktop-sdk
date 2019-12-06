kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/sndfile.bst

variables:
  conf-local: |
    --enable-sndfile

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libsamplerate.so'

sources:
- kind: tar
  url: tar_http:www.mega-nerd.com/SRC/libsamplerate-0.1.9.tar.gz
  ref: 0a7eb168e2f21353fb6d84da152e4512126f7dc48ccb0be80578c565413444c1
