kind: autotools

depends:
- filename: bootstrap/build/base-sdk.bst
  type: build
- filename: bootstrap/gnu-config.bst
  type: build
- filename: bootstrap/build/tools-lib-path.bst
  type: runtime

(@):
- elements/bootstrap/include/build.yml
- elements/bootstrap/include/elfutils-source.yml

variables:
  prefix: '%{tools}'
  lib: lib

  conf-local: >-
    --disable-debuginfod
