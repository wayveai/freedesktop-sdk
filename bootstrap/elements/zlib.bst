kind: autotools
description: zlib

depends:
- filename: zlib-build-deps.bst
  type: build
- filename: glibc.bst
  type: runtime

(@): target.yml

variables:
  conf-args: |
    --prefix=%{prefix} \
    --sharedlibdir=%{libdir} \
    --libdir=%{libdir}

environment:
  CHOST: '%{triplet}'

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libz.so'

sources:
- kind: git_tag
  url: https://github.com/madler/zlib.git
  track: master
  ref: v1.2.11-0-gcacf7f1d4e3d44d871b605da3b647f07d718623f
