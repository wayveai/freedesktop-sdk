kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/libogg.bst
- filename: components/speexdsp.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build


variables:
  conf-local: |
    --enable-binaries

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libspeex.so'

sources:
- kind: git_tag
  url: xiph:speex.git
  track: master
  ref: Speex-1.2.0-0-g7fc5f8b88519a2aafdf4b6a5c31ef3d54b560d68
