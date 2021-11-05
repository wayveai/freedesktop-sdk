kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/python3.bst

depends:
- bootstrap-import.bst

variables:
  conf-local: >-
    --enable-lib-only
    --disable-openssl

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libnghttp2.so'

sources:
- kind: git_tag
  url: github:nghttp2/nghttp2.git
  track: master
  ref: v1.46.0-0-g7af0c508be9cbec407268e2f546f597d268c104e
