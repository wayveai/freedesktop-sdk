kind: autotools

depends:
- filename: bootstrap-import.bst
  type: build
- filename: components/tar.bst
  type: build
- filename: cross-compilers/binutils-aarch64.bst
- filename: cross-compilers/standard-libs-aarch64.bst
  type: build

(@):
- elements/bootstrap/gcc-source.yml
- elements/cross-compilers/aarch64-vars.yml
- elements/cross-compilers/gcc-common.yml

variables:
  conf-extra: ''
