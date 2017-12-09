kind: myautotools

depends:
  - filename: bootstrap-import.bst
    type: build
  - filename: base/perl.bst
  - filename: base/texinfo.bst
    type: build

sources:
  - kind: tar
    url: http://ftp.gnu.org/gnu/groff/groff-1.22.3.tar.gz
    ref: 3a48a9d6c97750bfbd535feeb5be0111db6406ddb7bb79fc680809cda6d828a5
