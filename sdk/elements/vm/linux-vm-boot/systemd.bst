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
    -Daudit=false \
    -Dseccomp=false \
    -Dsystem-uid-max=999 \
    -Dsystem-gid-max=999

config:
  install-commands:
    (>):
      - |
        mv %{install-root}/etc %{install-root}/usr/etc
        mv %{install-root}/var %{install-root}/usr/var

sources:
- kind: git
  url: https://github.com/systemd/systemd.git
  track: v238
  ref: 738ab7502afb7663d9aacdd73e79025aa7cd0a9b
