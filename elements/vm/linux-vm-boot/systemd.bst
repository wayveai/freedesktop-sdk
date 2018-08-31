kind: meson

depends:
- filename: bootstrap-import.bst
  type: build
- filename: base/gettext.bst
  type: build
- filename: base/gperf.bst
  type: build
- filename: base/libcap.bst
- filename: base/libgcrypt.bst
- filename: base/libgpg-error.bst
- filename: base/m4.bst
  type: build
- filename: base/meson.bst
  type: build
- filename: base/ninja.bst
  type: build
- filename: base/pkg-config.bst
  type: build
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
    -Dsystem-gid-max=999

sources:
- kind: git
  url: https://github.com/systemd/systemd.git
  track: v239
  ref: de7436b02badc82200dc127ff190b8155769b8e7 #v239
