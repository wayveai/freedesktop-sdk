kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst

depends:
- bootstrap-import.bst
- components/libdrm.bst
- components/xorg-lib-x11.bst
- components/xorg-lib-xext.bst
- components/xorg-lib-xfixes.bst
- components/wayland.bst

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
  track: v2.10-branch
  ref: 2.10.0-0-ge3c7598743f10477f5799df42c806ba4945fd5c1
- kind: patch
  path: patches/libva/pkgconfig-driver-path.patch
