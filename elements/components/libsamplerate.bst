kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- bootstrap-import.bst
- components/sndfile.bst

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
  url: github_files:libsndfile/libsamplerate/releases/download/0.2.2/libsamplerate-0.2.2.tar.xz
  ref: 3258da280511d24b49d6b08615bbe824d0cacc9842b0e4caf11c52cf2b043893
