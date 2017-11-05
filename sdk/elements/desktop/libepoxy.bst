kind: myautotools

depends:
  - filename: base-stack.bst
  - filename: desktop/mesa.bst

public:
  bst:
    split-rules:
      devel:
        - "%{libdir}/libepoxy.so"

sources:
  - kind: tar
    url: https://github.com/anholt/libepoxy/releases/download/1.4.3/libepoxy-1.4.3.tar.xz
    ref: 0b808a06c9685a62fca34b680abb8bc7fb2fda074478e329b063c1f872b826f6
