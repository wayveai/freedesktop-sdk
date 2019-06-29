kind: autotools
description: Glib

depends:
- filename: bootstrap-import.bst
- filename: base/buildsystem-autotools.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libarchive.so'

  cpe:
    patches:
    - CVE-2018-1000877
    - CVE-2018-1000878
    - CVE-2018-1000879
    - CVE-2018-1000880
    - CVE-2019-1000019
    - CVE-2019-1000020

sources:
- kind: git_tag
  url: github:libarchive/libarchive.git
  track: master
  ref: v3.3.3-0-g5fe69dd018745a88eecf1f7db40daf12d26f7ed0
- kind: patch
  path: patches/libarchive/CVE-2018-1000877.patch
- kind: patch
  path: patches/libarchive/CVE-2018-1000878.patch
- kind: patch
  path: patches/libarchive/CVE-2018-1000879.patch
- kind: patch
  path: patches/libarchive/CVE-2018-1000880.patch
- kind: patch
  path: patches/libarchive/CVE-2019-1000019.patch
- kind: patch
  path: patches/libarchive/CVE-2019-1000020.patch
