kind: autotools

depends:
- filename: bootstrap-import.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libpixman-1.so'

sources:
- kind: tar
  url: https://www.x.org/archive/individual/lib/pixman-0.34.0.tar.bz2
  ref: 39ba3438f3d17c464b0cb8be006dacbca0ab5aee97ebde69fec7ecdbf85794a0
