kind: myautotools

depends:
  - filename: bootstrap-import.bst
    type: build

public:
  bst:
    split-rules:
      devel:
        (>):
          - "%{libdir}/libpng.so"
          - "%{libdir}/libpng16.so"

sources:
  - kind: tar
    url: https://download.sourceforge.net/libpng/libpng-1.6.32.tar.xz
    ref: c918c3113de74a692f0a1526ce881dc26067763eb3915c57ef3a0f7b6886f59b
