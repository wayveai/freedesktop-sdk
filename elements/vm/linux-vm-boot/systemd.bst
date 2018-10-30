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
    -Dsystem-gid-max=999

sources:
- kind: git_tag
  url: https://github.com/systemd/systemd.git
  track: master
  ref: de7436b02badc82200dc127ff190b8155769b8e7 #v239
- kind: patch
  path: patches/0001-meson-rename-Ddebug-to-Ddebug-extra.patch
