kind: autotools

depends:
  - filename: bootstrap-import.bst

public:
  bst:
    split-rules:
      devel:
        (>):
          - "%{libdir}/libexpat.so"

sources:
  - kind: tar
    url: https://github.com/libexpat/libexpat/releases/download/R_2_2_4/expat-2.2.4.tar.bz2
    ref: 03ad85db965f8ab2d27328abcf0bc5571af6ec0a414874b2066ee3fdd372019e
