kind: filter

depends:
- filename: extensions/mesa/mesa-base.bst
  type: build
- filename: components/wayland.bst
  type: runtime
- filename: components/libdrm.bst
  type: runtime

config:
  include:
  - gbm
  include-orphans: False

variables:
  prefix: "/usr/lib/%{gcc_triplet}/GL/default"
  lib: "lib"
  debugdir: "/usr/lib/debug"

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libgbm.so'
