kind: myautotools

depends:
  - filename: bootstrap-import.bst
    type: build

public:
  bst:
    split-rules:
      devel:
        - "%{libdir}/libtiff.so"
        - "%{libdir}/libtiffxx.so"

sources:
  - kind: tar
    url: http://download.osgeo.org/libtiff/tiff-4.0.8.tar.gz
    ref: 59d7a5a8ccd92059913f246877db95a2918e6c04fb9d43fd74e5c3390dac2910
