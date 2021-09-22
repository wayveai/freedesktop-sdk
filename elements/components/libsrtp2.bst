kind: meson

build-depends:
- components/doxygen.bst
- public-stacks/buildsystem-meson.bst

depends:
- bootstrap-import.bst

variables:
  meson-local: >-
    -Dpcap-tests=disabled

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libsrtp2.so'

sources:
- kind: git_tag
  url: github:cisco/libsrtp.git
  track: master
  match:
  - v*.*.*
  track-extra:
  - 2_4_x_throttle
  ref: v2.4.2-0-g90d05bf8980d16e4ac3f16c19b77e296c4bc207b
