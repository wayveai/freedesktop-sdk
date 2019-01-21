kind: meson

depends:
- filename: bootstrap-import.bst
- filename: desktop/libdrm.bst
- filename: desktop/xorg-lib-x11.bst
- filename: desktop/xorg-lib-xext.bst
- filename: desktop/xorg-lib-xfixes.bst
- filename: desktop/wayland-protocols.bst
  type: build
- filename: base/buildsystem-meson.bst
  type: build

variables:
  meson-local: |
    -Ddriverdir="%{libdir}/dri:%{libdir}/dri/intel-vaapi-driver"

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libva.so'
        - '%{libdir}/libva-tpi.so'
        - '%{libdir}/libva-x11.so'
        - '%{libdir}/libva-drm.so'
        - '%{libdir}/libva-egl.so'
        - '%{libdir}/libva-glx.so'
        - '%{libdir}/libva-wayland.so'

sources:
- kind: git_tag
  url: github:intel/libva
  track: master
  ref: 2.3.0-0-g3695f8b0c66e7fdf22918c80dc62dab4c15052cb
