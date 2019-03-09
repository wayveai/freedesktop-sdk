kind: autotools

depends:
- filename: bootstrap/build/base-sdk.bst
  type: build
- filename: bootstrap/gnu-config.bst
  type: build
- filename: bootstrap/build/tools-lib-path.bst
  type: runtime

(@): elements/bootstrap/build.yml

variables:
  prefix: '%{tools}'
  lib: lib

sources:
- kind: tar
  url: sourceware_pub:elfutils/0.176/elfutils-0.176.tar.bz2
  ref: eb5747c371b0af0f71e86215a5ebb88728533c3a104a43d4231963f308cd1023
