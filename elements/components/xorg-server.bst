kind: meson

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-meson.bst
  type: build
- filename: components/nettle.bst
- filename: components/libtirpc.bst
- filename: components/krb5.bst
  type: build
- filename: components/libdrm.bst
- filename: extensions/mesa/gbm.bst
- filename: components/libepoxy.bst
- filename: components/pixman.bst
- filename: components/xorg-lib-xkbfile.bst
- filename: components/xorg-lib-xfont2.bst
- filename: components/xorg-lib-xdmcp.bst
- filename: components/xorg-lib-xshmfence.bst
- filename: components/xorg-app-xkbcomp.bst
- filename: components/xorg-font-util.bst
- filename: components/xorg-proto-xorgproto.bst
  type: build
- filename: components/wayland.bst
- filename: components/wayland-protocols.bst
  type: build
- filename: components/systemd.bst

variables:
  meson-local: |
    -Dxvfb=false \
    -Dxnest=false \
    -Dxwin=false \
    -Dglamor=true \
    -Dxwayland=true

environment:
  PKG_CONFIG_PATH: '%{libdir}/GL/default/lib/pkgconfig'

sources:
- kind: tar
  url: https://www.x.org/archive/individual/xserver/xorg-server-1.20.4.tar.gz
  ref: a6447de89eca3e22eeead682b325d902779569534ad83388c9e16611d72baaf3
