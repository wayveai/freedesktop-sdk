kind: meson

depends:
- filename: bootstrap-import.bst
- filename: components/libdrm.bst
- filename: components/xorg-lib-x11.bst
- filename: components/xorg-lib-xext.bst
- filename: components/xorg-lib-xfixes.bst
- filename: components/wayland.bst
- filename: public-stacks/buildsystem-meson.bst
  type: build

variables:
  meson-local: |
    -Ddriverdir="%{libdir}/dri:%{libdir}/dri/intel-vaapi-driver" \
    -Dwith_glx=no \
    -Dwith_wayland=yes \
    -Dwith_x11=yes

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libva.so'
        - '%{libdir}/libva-tpi.so'
        - '%{libdir}/libva-x11.so'
        - '%{libdir}/libva-drm.so'
        - '%{libdir}/libva-wayland.so'

sources:
- kind: git_tag
  url: github:intel/libva
  track: v2.4-branch
  ref: 2.4.1-0-gc3d0d13e8e1cd8de8972a6bf766bdee2a2ac66f1
- kind: patch
  path: patches/libva/pkgconfig-driver-path.patch
