kind: meson

depends:
- filename: bootstrap-import.bst
- filename: desktop/libdrm.bst
- filename: desktop/xorg-lib-x11.bst
- filename: desktop/xorg-lib-xext.bst
- filename: desktop/xorg-lib-xfixes.bst
- filename: desktop/wayland.bst
- filename: base/buildsystem-meson.bst
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
  url: github:intel/libva.git
  track: v2.4-branch
  ref: 2.4.0-0-g25b33076849e68bebae87771fb482c5ab929e18b
- kind: patch
  path: patches/libva/pkgconfig-driver-path.patch
