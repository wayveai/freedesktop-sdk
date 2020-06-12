kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

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
