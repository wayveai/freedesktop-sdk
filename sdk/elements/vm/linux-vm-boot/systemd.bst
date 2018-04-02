kind: meson

depends:
- filename: bootstrap-import.bst
  type: build
- filename: base/gettext.bst
  type: build
- filename: base/gperf.bst
  type: build
- filename: base/libcap.bst
  type: build
- filename: base/libgcrypt.bst
  type: build
- filename: base/libgpg-error.bst
  type: build
- filename: base/m4.bst
  type: build
- filename: base/meson.bst
  type: build
- filename: base/ninja.bst
  type: build
- filename: base/pkg-config.bst
  type: build
- filename: base/util-linux.bst
  type: build

variables:
  meson-local: |
    -Drootlibdir=%{libdir} \
    -Dacl=false \
    -Daudit=false \
    -Dseccomp=false \
    -Dsystem-uid-max=999 \
    -Dsystem-gid-max=999

sources:
- kind: git
  url: https://github.com/systemd/systemd.git
  track: v237
  ref: 46659f7deb962f55c728e70597e37c2a3ab6326d
