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
  url: sourceware_pub:elfutils/0.175/elfutils-0.175.tar.bz2
  ref: f7ef925541ee32c6d15ae5cb27da5f119e01a5ccdbe9fe57bf836730d7b7a65b
- kind: patch
  path: patches/elfutils/CVE-2019-7146.patch
- kind: patch
  path: patches/elfutils/CVE-2019-7149.patch
- kind: patch
  path: patches/elfutils/CVE-2019-7150.patch
