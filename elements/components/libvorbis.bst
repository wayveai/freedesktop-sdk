kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/libogg.bst
- filename: public-stacks/buildsystem-autotools.bst
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
    patches:
    - CVE-2018-10392
    - CVE-2018-10393

sources:
- kind: git_tag
  url: github:xiph/vorbis.git
  track: master
  ref: v1.3.7-0-g0657aee69dec8508a0011f47f3b69d7538e9d262
- kind: patch
  path: patches/libvorbis/CVE-2018-10392.patch
