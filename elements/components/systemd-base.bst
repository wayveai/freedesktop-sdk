kind: meson

depends:
- filename: bootstrap-import.bst
  type: build
- filename: public-stacks/buildsystem-meson.bst
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
# cpe metadata should be written in
# elements/components/libsystemd.bst

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
  track: v242-stable
  track-tags: false
  ref: v242-29-g298d13df7ef1097fa4801de573f668cef23a22b3
