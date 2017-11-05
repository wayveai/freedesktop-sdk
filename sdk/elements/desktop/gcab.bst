kind: myautotools

depends:
  - filename: base-stack.bst

public:
  bst:
    split-rules:
      devel:
        - "%{libdir}/libgcab-1.0.so"

sources:
  - kind: tar
    url: https://download.gnome.org/sources/gcab/0.7/gcab-0.7.tar.xz
    ref: a16e5ef88f1c547c6c8c05962f684ec127e078d302549f3dfd2291e167d4adef
