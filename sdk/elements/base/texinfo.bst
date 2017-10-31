kind: myautotools
description: GNU texinfo

depends:
  - filename: bootstrap-import.bst
  - filename: base/perl.bst
    type: build

sources:
  - kind: tar
    url: http://ftp.gnu.org/gnu/texinfo/texinfo-6.5.tar.xz
    ref: 77774b3f4a06c20705cc2ef1c804864422e3cf95235e965b1f00a46df7da5f62
