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
    -Dsystem-gid-max=999

public:
  cpe:
    vendor: freedesktop
    version: '239'

sources:
- kind: git_tag
  url: github:systemd/systemd.git
  track: master
  ref: v239-0-gde7436b02badc82200dc127ff190b8155769b8e7
  # We enable various kernel configurations required for systemd
  # in vm/bsp-generic/linux.bst. When bumping the systemd version
  # please check the systemd README for any necessary changes
- kind: patch
  path: patches/0001-meson-rename-Ddebug-to-Ddebug-extra.patch
