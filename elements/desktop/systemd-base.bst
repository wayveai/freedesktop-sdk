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
    version: '241'

  bst:
    split-rules:
      libsystemd:
        - '%{libdir}'
        - '%{libdir}/libsystemd*.so*'
        - '%{libdir}/pkgconfig'
        - '%{libdir}/pkgconfig/libsystemd.pc'
        - '%{datadir}/pkgconfig'
        - '%{datadir}/pkgconfig/systemd.pc'
        - '%{includedir}'
        - '%{includedir}/systemd'
        - '%{includedir}/systemd/**'
        - '%{debugdir}/dwz/%{element-name}/debug'
        - '%{debugdir}%{libdir}/libsystemd*.so*'
        - '%{sourcedir}'
        - '%{sourcedir}/**'

sources:
- kind: git_tag
  url: github:systemd/systemd-stable.git
  track: v241-stable
  track-tags: false
  ref: v241-9-gc1f8ff8d0de7e303b8004b02a0a47d4cc103a7f8
