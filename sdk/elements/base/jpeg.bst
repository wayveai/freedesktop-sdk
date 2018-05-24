kind: autotools

depends:
  - filename: bootstrap-import.bst
  - filename: base/nasm.bst
    type: build

public:
  bst:
    split-rules:
      devel:
        (>):
          - "%{libdir}/libjpeg.so"
          - "%{libdir}/libturbojpeg.so"

sources:
  - kind: tar
    url: https://sourceforge.net/projects/libjpeg-turbo/files/1.5.2/libjpeg-turbo-1.5.2.tar.gz
    ref: 9098943b270388727ae61de82adec73cf9f0dbb240b3bc8b172595ebf405b528
