kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/libogg.bst
- filename: base/buildsystem-autotools.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libvorbis.so'
        - '%{libdir}/libvorbisfile.so'
        - '%{libdir}/libvorbisenc.so'
  cpe:
    version: '1.3.6'

sources:
- kind: git_tag
  url: github:xiph/vorbis
  ref: v1.3.6-0-gd22c3ab5f633460abc2532feee60ca0892134cbf
