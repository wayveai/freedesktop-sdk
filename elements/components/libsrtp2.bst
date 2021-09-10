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
  track-extra:
  - 2_4_x_throttle
  ref: v2-0-g8d51b88503c62bb2c0525de15aebe7d57ccdb4e4
