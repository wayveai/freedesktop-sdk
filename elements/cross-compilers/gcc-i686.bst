kind: autotools

build-depends:
- bootstrap-import.bst
- components/tar.bst
- cross-compilers/standard-libs-i686.bst
- public-stacks/buildsystem-autotools.bst
- components/texinfo.bst
- components/autoconf2.69.bst

depends:
- cross-compilers/binutils-i686.bst

(@):
- elements/bootstrap/include/gcc-source.yml
- elements/cross-compilers/i686-vars.yml
- elements/cross-compilers/gcc-common.yml

variables:
  conf-extra: >-
    --with-cpu=pentium4
    --with-tune=generic
    --with-fpmath=sse
