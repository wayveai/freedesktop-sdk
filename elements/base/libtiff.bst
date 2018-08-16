kind: autotools

depends:
- filename: bootstrap-import.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libtiff.so'
        - '%{libdir}/libtiffxx.so'
  cpe:
    version: '4.0.9'

sources:
- kind: git_tag
  url: https://gitlab.com/libtiff/libtiff.git
  track: master
  ref: Release-v4-0-9-0-g020bd2fd3b4235b2175dafa9633d2b191c50e7cd
