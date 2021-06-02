kind: autotools

build-depends:
- bootstrap/build/base-sdk.bst
- bootstrap/gnu-config.bst

depends:
- bootstrap/build/file-stage1.bst
- bootstrap/build/elfutils-build.bst

(@):
- elements/bootstrap/include/build.yml
- elements/bootstrap/include/debugedit-source.yml
