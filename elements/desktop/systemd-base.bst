kind: meson

depends:
- filename: bootstrap-import.bst
  type: build
- filename: base/buildsystem-meson.bst
  type: build
- filename: base/gettext.bst
  type: build
- filename: base/gperf.bst
  type: build
- filename: base/m4.bst
  type: build
- filename: base/libcap.bst
- filename: base/libgcrypt.bst
- filename: base/libgpg-error.bst
- filename: base/util-linux.bst
- filename: base/xz.bst
- filename: desktop/dbus.bst

variables:
  meson-local: |
    -Drootprefix=%{prefix} \
    -Drootlibdir=%{libdir} \
    -Dsysvinit-path=%{sysconfdir}/init.d \
    -Daudit=false \
    -Dseccomp=false \
    -Dsystem-uid-max=999 \
    -Dsystem-gid-max=999 \
    -Dopenssl=false

public:
  cpe:
    vendor: 'freedesktop'
    product: 'systemd'
    version: '240'

sources:
- kind: git_tag
  url: github:systemd/systemd-stable.git
  track: v240-stable
  track-tags: false
  ref: v240-34-gf02b5472c6f0c41e5dc8dc2c84590866baf937ff
