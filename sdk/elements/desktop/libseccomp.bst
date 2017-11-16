kind: myautotools

depends:
  - filename: base.bst
    type: build

public:
  bst:
    split-rules:
      devel:
        - "%{libdir}/libseccomp.so"

sources:
  - kind: tar
    url: https://github.com/seccomp/libseccomp/releases/download/v2.3.2/libseccomp-2.3.2.tar.gz
    ref: 3ddc8c037956c0a5ac19664ece4194743f59e1ccd4adde848f4f0dae7f77bca1
