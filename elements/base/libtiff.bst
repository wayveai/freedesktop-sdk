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

sources:
- kind: git_tag
  url: https://gitlab.com/libtiff/libtiff.git
  track: master
  ref: 020bd2fd3b4235b2175dafa9633d2b191c50e7cd   #v4-0-9
