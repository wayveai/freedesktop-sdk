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
# cpe metadata should be written in
# elements/desktop/libsystemd.bst

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
        - '%{debugdir}%{libdir}'
        - '%{debugdir}%{libdir}/libsystemd*.so*'
        - '%{sourcedir}'
        - '%{sourcedir}/**'

sources:
- kind: git_tag
  url: github:systemd/systemd-stable.git
  track: v241-stable
  track-tags: false
  ref: v241-116-g9ef65cb6b2de877dde1a6dadbe8e7056179fc3c5
