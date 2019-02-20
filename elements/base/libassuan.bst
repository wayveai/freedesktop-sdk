kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/libgpg-error.bst
- filename: base/buildsystem-autotools.bst
  type: build
- filename: base/texinfo.bst
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
        - '%{libdir}/libassuan.so'

sources:
- kind: git_tag
  url: gnupg:libassuan.git
  track: master
  ref: libassuan-2.5.3-0-g4de3154ea6e6e89e34760b7b9e0eed5123bb81f9
