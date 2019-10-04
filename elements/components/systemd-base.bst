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
# elements/components/systemd-libs.bst

  bst:
    split-rules:
      systemd-libs:
      - '%{libdir}'
      - '%{libdir}/libsystemd*.so*'
      - '%{libdir}/libudev*.so*'
      - '%{libdir}/pkgconfig'
      - '%{libdir}/pkgconfig/libsystemd.pc'
      - '%{libdir}/pkgconfig/libudev.pc'
      - '%{datadir}/pkgconfig'
      - '%{datadir}/pkgconfig/systemd.pc'
      - '%{includedir}'
      - '%{includedir}/libudev.h'
      - '%{includedir}/systemd'
      - '%{includedir}/systemd/**'
      - '%{debugdir}/dwz/%{element-name}/debug'
      - '%{debugdir}%{libdir}/libsystemd*.so*'
      - '%{debugdir}%{libdir}/libudev*.so*'
      - '%{sourcedir}'
      - '%{sourcedir}/**'

sources:
- kind: git_tag
  url: github:systemd/systemd-stable.git
  track: v242-stable
  track-tags: false
  ref: v242-85-g07f0549ffe3413f0e78b656dd34d64681cbd8f00
- kind: patch
  path: patches/systemd/001-CVE-2018-20839.patch
- kind: patch
  path: patches/systemd/002-CVE-2018-20839.patch
