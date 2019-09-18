kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/buildsystem-autotools.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libpng.so'
        - '%{libdir}/libpng16.so'

sources:
- kind: git_tag
  url: github:glennrp/libpng
  track: libpng16
  ref: v1.6.37-0-ga40189cf881e9f0db80511c382292a5604c3c3d1
- kind: patch
  path: patches/libpng/libpng-1.6.37-apng.patch
