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
  cpe:
    patches:
    - CVE-2022-37434

sources:
- kind: git_tag
  url: github:madler/zlib.git
  track: master
  ref: v1.2.12-0-g21767c654d31d2dccdde4330529775c6c5fd5389
- kind: patch_queue
  path: patches/zlib
