kind: myautotools

depends:
  - filename: base.bst
    type: build

public:
  bst:
    split-rules:
      devel:
        - "%{libdir}/libjson-glib-1.0.so"

sources:
  - kind: tar
    url: https://download.gnome.org/sources/json-glib/1.4/json-glib-1.4.2.tar.xz
    ref: 2d7709a44749c7318599a6829322e081915bdc73f5be5045882ed120bb686dc8
