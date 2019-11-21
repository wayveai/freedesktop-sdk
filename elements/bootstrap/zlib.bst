kind: autotools
description: zlib

depends:
- filename: bootstrap/zlib-build-deps.bst
  type: build
- filename: bootstrap/glibc.bst
  type: runtime

(@): elements/bootstrap/include/target.yml

variables:
  conf-args: |
    --prefix=%{prefix} \
    --sharedlibdir=%{libdir} \
    --libdir=%{libdir}

environment:
  CHOST: '%{triplet}'

config:
  install-commands:
    (>):
    - |
      find "%{install-root}" -name "lib*.a" -exec rm {} ";"

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libz.so'

sources:
- kind: git_tag
  url: github:madler/zlib.git
  track: master
  ref: v1.2.11-0-gcacf7f1d4e3d44d871b605da3b647f07d718623f
