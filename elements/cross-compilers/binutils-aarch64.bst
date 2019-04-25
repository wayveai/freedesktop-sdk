kind: autotools

depends:
- filename: bootstrap-import.bst
  type: build
- filename: components/texinfo.bst
  type: build
- filename: components/bison.bst
  type: build
- filename: components/flex.bst
  type: build

(@):
- elements/cross-compilers/aarch64-vars.yml
- elements/bootstrap/binutils-source.yml
- elements/cross-compilers/binutils-common.yml
