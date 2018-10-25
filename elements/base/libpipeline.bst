kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/gdbm.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libpipeline.so'

sources:
- kind: tar
  url: https://download.savannah.nongnu.org/releases/libpipeline/libpipeline-1.5.0.tar.gz
  ref: 0d72e12e4f2afff67fd7b9df0a24d7ba42b5a7c9211ac5b3dcccc5cd8b286f2b
