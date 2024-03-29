kind: meson

build-depends:
- bootstrap-import.bst
- public-stacks/buildsystem-meson.bst
- components/gperf.bst
- components/m4.bst
- components/libcap.bst
- components/libgpg-error.bst
- components/lz4.bst
- components/util-linux-full.bst
- components/linux-pam.bst
- components/kmod.bst
- components/libxslt.bst
- components/docbook-xsl.bst
- components/python3-jinja2.bst

variables:
  meson-local: >-
    -Drootprefix=%{prefix}
    -Drootlibdir=%{libdir}
    -Dsysvinit-path=%{sysconfdir}/init.d
    -Daudit=false
    -Dseccomp=false
    -Dsystem-uid-max=999
    -Dsystem-gid-max=999
    -Dusers-gid=100
    -Dopenssl=true
    -Dpam=true
    -Dgnu-efi=false
    -Defi=false
    -Dfirstboot=true
    -Dzlib=true
    -Dbzip2=true
    -Dxz=true
    -Dlz4=true
    -Ddefault-dnssec=no
    -Drepart=false
    -Dman=false
    -Dhtml=false
    -Dlibcryptsetup=false
    -Dp11kit=false
    -Dlibfido2=false

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
      - '%{libdir}/libnss_resolve.so*'
      - '%{libdir}/pkgconfig'
      - '%{libdir}/pkgconfig/libsystemd.pc'
      - '%{libdir}/pkgconfig/libudev.pc'
      - '%{includedir}'
      - '%{includedir}/libudev.h'
      - '%{includedir}/systemd'
      - '%{includedir}/systemd/**'
      - '%{debugdir}/dwz/%{element-name}/*'
      - '%{debugdir}%{libdir}/libsystemd*.so*'
      - '%{debugdir}%{libdir}/libudev*.so*'
      - '%{sourcedir}'
      - '%{sourcedir}/**'

(@):
- elements/include/systemd.yml
