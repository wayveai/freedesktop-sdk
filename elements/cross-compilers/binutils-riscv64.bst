kind: autotools

build-depends:
- bootstrap-import.bst
- components/texinfo.bst
- components/bison.bst
- components/flex.bst

(@):
- elements/cross-compilers/riscv64-vars.yml
- elements/bootstrap/include/binutils-source.yml
- elements/cross-compilers/binutils-common.yml
