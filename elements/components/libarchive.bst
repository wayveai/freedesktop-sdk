kind: autotools
description: Multi-format archive and compression library

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libarchive.so'
  cpe:
    patches:
    - CVE-2019-19221

sources:
- kind: git_tag
  url: github:libarchive/libarchive.git
  track: master
  ref: v3.4.0-0-g614110e76d9dbb9ed3e159a71cbd75fa3b23efe3
- kind: patch
  path: patches/libarchive/CVE-2019-19221.patch
