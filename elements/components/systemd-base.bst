kind: meson

# This element is not be used directly. Use either:
#  - components/systemd.bst
#  - components/systemd-libs.bst

build-depends:
- bootstrap-import.bst
- public-stacks/buildsystem-meson.bst
- components/gperf.bst
- components/m4.bst
- components/libcap.bst
- components/libgcrypt.bst
- components/libgpg-error.bst
- components/lz4.bst
- components/util-linux.bst
- components/xz.bst
- components/linux-pam.bst
- components/kmod.bst
- components/gnu-efi-maybe.bst

variables:
  efi: 'false'
  (?):
  - target_arch in ["x86_64", "i686", "arm", "aarch64"]:
      efi: 'true'
  meson-local: >-
    -Drootprefix=%{prefix}
    -Drootlibdir=%{libdir}
    -Dsysvinit-path=%{sysconfdir}/init.d
    -Daudit=false
    -Dseccomp=false
    -Dsystem-uid-max=999
    -Dsystem-gid-max=999
    -Dopenssl=false
    -Dpam=true
    -Dgnu-efi=%{efi}
    -Defi=%{efi}
    -Dfirstboot=true
    -Dzlib=true
    -Dbzip2=true
    -Dxz=true
    -Dlz4=true
    -Ddefault-dnssec=no

public:
  cpe:
    vendor: 'freedesktop'
    product: 'systemd'
    version-match: '\d+'

  bst:
    split-rules:
      systemd-libs:
      - '%{libdir}'
      - '%{libdir}/libsystemd*.so*'
      - '%{libdir}/libudev*.so*'
      - '%{libdir}/pkgconfig'
      - '%{libdir}/pkgconfig/libsystemd.pc'
      - '%{libdir}/pkgconfig/libudev.pc'
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
  track: master
  track-extra:
  - v245-stable
  ref: v245.4-0-g2c4229221c77e3bcc7d32418d8adf1efce3ba962
- kind: patch
  path: patches/systemd/relax-boot-device-check-btrfs.patch
