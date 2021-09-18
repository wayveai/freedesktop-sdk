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
  ref: v2.4.0-0-g063e3652feae15ec48614a91d32757781e6251b4
