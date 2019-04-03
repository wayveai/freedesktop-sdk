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

  conf-local: |
    --disable-werror

public:
    patches:
      - 'CVE-2018-19591'

config:
  install-commands:
    (>):
    - |
      rm -r "%{install-root}%{libexecdir}/getconf"

sources:
- kind: git_tag
  url: sourceware:glibc.git
  track: release/2.28/master
  ref: glibc-2.28-60-g4d7af7815af5217db6e8fde6032ddf4f6b2a4420
