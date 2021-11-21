kind: autotools
description: libffi

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/texinfo.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libffi.so'
        - '%{libdir}/libffi-3.2.1/include'
        - '%{libdir}/libffi-3.2.1/include/**'

config:
  install-commands:
    (>):
    - |
      rm "%{install-root}%{infodir}/dir"

sources:
- kind: git_tag
  url: github:libffi/libffi.git
  # ABI break on 3.4.0
  ref: v3.3-0-g5dcb741f1544c5e18c9dbf96aeb8b61cc556a616
