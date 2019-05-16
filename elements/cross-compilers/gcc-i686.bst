kind: autotools

depends:
- filename: bootstrap-import.bst
  type: build
- filename: components/tar.bst
  type: build
- filename: cross-compilers/binutils-i686.bst
- filename: cross-compilers/standard-libs-i686.bst
  type: build

(@):
- elements/bootstrap/gcc-source.yml
- elements/cross-compilers/i686-vars.yml
- elements/cross-compilers/gcc-common.yml

variables:
  conf-extra: >-
    --with-cpu=pentium4
    --with-tune=generic
    --with-fpmath=sse
