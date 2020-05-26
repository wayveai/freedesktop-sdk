kind: autotools

(@):
- elements/bootstrap/include/build.yml

depends:
- bootstrap/build/base-sdk.bst

build-depends:
- bootstrap/gnu-config.bst

variables:
  conf-local: >-
    --without-included-zlib

sources:
- kind: git_tag
  url: gitlab:freedesktop-sdk/mirrors/samba/rsync.git
  track: master
  ref: v3.1.3-0-gd73762eea3f15f2c56bb3fa9394ad1883c25c949
