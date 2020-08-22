kind: autotools

build-depends:
- bootstrap/xz-build-deps.bst

runtime-depends:
- bootstrap/glibc.bst

variables:
  autogen: ./autogen.sh --no-po4a

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/liblzma.so'

(@):
- elements/include/xz-source.yml
- elements/bootstrap/include/target.yml
