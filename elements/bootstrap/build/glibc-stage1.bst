kind: autotools

depends:
- filename: bootstrap/build/base-sdk.bst
  type: build
- filename: bootstrap/gnu-config.bst
  type: build

(@): elements/bootstrap/build.yml

variables:
  prefix: /glibc
  sysconfdir: /glibc/etc
  localstatedir: /glibc/var
  lib: lib

public:
    patches:
      - 'CVE-2017-18269'
      - 'CVE-2018-11236'
      - 'CVE-2018-11237'
      - 'CVE-2018-19591'

sources:
- kind: git_tag
  url: sourceware:glibc.git
  track: release/2.27/master
  ref: 2.27-99-gf6d0e8c36f02b387d33f2cc58c7cb204f201d92e
