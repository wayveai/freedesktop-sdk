kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/buildsystem-autotools.bst
- filename: base/libflac.bst
- filename: base/libogg.bst
- filename: base/libvorbis.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libsndfile.so'

variables:
  conf-local: |
    --enable-external-libs

sources:
- kind: tar
  url: http://www.mega-nerd.com/libsndfile/files/libsndfile-1.0.28.tar.gz
  ref: 1ff33929f042fa333aed1e8923aa628c3ee9e1eb85512686c55092d1e5a9dfa9

