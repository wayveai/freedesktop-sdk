kind: meson

depends:
- components/systemd.bst

build-depends:
- components/libcap.bst
- components/libxslt.bst
- public-stacks/buildsystem-meson.bst

sources:
- kind: git_tag
  url: github:iputils/iputils.git
  track: master
  ref: s20190709-0-g13e00847176aa23683d68fce1d17ffb523510946

variables:
  meson-local: >-
    -DBUILD_RARPD=true
    -DBUILD_TFTPD=true
    -DBUILD_TRACEROUTE6=true
