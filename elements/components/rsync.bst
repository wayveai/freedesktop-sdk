kind: autotools

depends:
- bootstrap-import.bst

build-depends:
- public-stacks/buildsystem-autotools.bst

variables:
  conf-local: >-
    --without-included-zlib

sources:
- kind: git_tag
  url: gitlab:freedesktop-sdk/mirrors/samba/rsync.git
  track: master
  ref: v3.1.3-0-gd73762eea3f15f2c56bb3fa9394ad1883c25c949
