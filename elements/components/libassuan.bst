kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/libgpg-error.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/texinfo.bst
  type: build

variables:
  conf-local: |
    --enable-maintainer-mode

config:
  install-commands:
    (>):
    - rm "%{install-root}/usr/share/info/dir"

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{bindir}/libassuan-config'
        - '%{libdir}/libassuan.so'

sources:
- kind: git_tag
  url: gnupg:libassuan.git
  track: master
  ref: libassuan-2.5.4-0-ge368b400f276d5d9868832e7a652ab250dd57555
