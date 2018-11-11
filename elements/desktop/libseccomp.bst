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
        - '%{libdir}/libseccomp.so'

sources:
- kind: git_tag
  url: github:seccomp/libseccomp/
  track: master
  ref: 74b190e1aa05f07da0c61fb9a30dbc9c18ce2c9d    # 2.3.3
