kind: autotools

depends:
- filename: bootstrap/build/base-sdk.bst
  type: build
- filename: bootstrap/gnu-config.bst
  type: build

(@):
- elements/bootstrap/include/build.yml
- elements/bootstrap/include/elfutils-source.yml

variables:
  prefix: '%{tools}'
  lib: lib

  conf-local: >-
    --disable-debuginfod
