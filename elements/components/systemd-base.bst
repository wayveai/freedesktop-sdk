kind: meson

depends:
- filename: bootstrap-import.bst
  type: build
- filename: public-stacks/buildsystem-meson.bst
  type: build
- filename: components/gettext.bst
  type: build
- filename: components/gperf.bst
  type: build
- filename: components/m4.bst
  type: build
- filename: components/libcap.bst
- filename: components/libgcrypt.bst
- filename: components/libgpg-error.bst
- filename: components/util-linux.bst
- filename: components/xz.bst
- filename: components/linux-pam.bst

variables:
  meson-local: |
    -Drootprefix=%{prefix} \
    -Drootlibdir=%{libdir} \
    -Dsysvinit-path=%{sysconfdir}/init.d \
    -Daudit=false \
    -Dseccomp=false \
    -Dsystem-uid-max=999 \
    -Dsystem-gid-max=999 \
    -Dopenssl=false \
    -Dpam=true

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
