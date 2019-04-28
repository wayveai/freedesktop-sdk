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

config:
  install-commands:
    (>):
    - |
      rm -r "%{install-root}%{libexecdir}/getconf"

    - |
      rm "%{install-root}%{infodir}/dir"

sources:
- kind: git_tag
  url: sourceware:glibc.git
  track: release/2.28/master
  track-tags: false
  ref: glibc-2.28-98-g5cbb73004b635e762e20b447c2d93c307cb40f41
