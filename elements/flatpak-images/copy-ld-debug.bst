kind: script
description: |
    Because sdk-image.bst re-tags ld.so.debug as debug it fails to
    appear in the SDK.

build-depends:
- bootstrap-import.bst

public:
  bst:
    split-rules:
      debug: []

config:
  commands:
  - install -D -t '%{install-root}%{debugdir}%{libdir}' '%{debugdir}%{libdir}'/ld-*.so.debug
  - install -D -t '%{install-root}%{debugdir}/dwz/bootstrap/glibc.bst/' '%{debugdir}/dwz/bootstrap/glibc.bst'/*
