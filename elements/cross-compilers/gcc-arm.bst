kind: autotools

depends:
- filename: bootstrap-import.bst
  type: build
- filename: components/tar.bst
  type: build
- filename: cross-compilers/binutils-arm.bst
- filename: cross-compilers/standard-libs-arm.bst
  type: build

(@):
- elements/bootstrap/gcc-source.yml
- elements/cross-compilers/arm-vars.yml
- elements/cross-compilers/gcc-common.yml

variables:
  conf-extra: >-
    --with-mode=thumb
    --with-fpu=vfpv3-d16
    --with-arch=armv7-a
    --with-float=hard
