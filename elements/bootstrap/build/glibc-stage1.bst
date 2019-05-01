kind: autotools

depends:
- filename: bootstrap/build/base-sdk.bst
  type: build
- filename: bootstrap/gnu-config.bst
  type: build

(@):
- elements/bootstrap/build.yml
- elements/bootstrap/glibc-source.yml

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
