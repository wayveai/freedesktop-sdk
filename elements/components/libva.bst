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
    -Ddriverdir="%{libdir}/dri:%{libdir}/dri/intel-vaapi-driver:%{libdir}/GL/lib/dri" \
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
  track: v2.5-branch
  ref: 2.5.0-0-ga7dc5b7f0501dcc5e88df1638b6f80d3b03f4c67
- kind: patch
  path: patches/libva/pkgconfig-driver-path.patch
