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
  ref: v1.48.0-0-gb5c4ba83222606b145e6a49c63d7ea53019f65e6
