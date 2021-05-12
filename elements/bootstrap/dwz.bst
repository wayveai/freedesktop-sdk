kind: manual

(@): elements/bootstrap/include/target.yml

depends:
- filename: bootstrap/dwz-build-deps.bst
  type: build

- filename: bootstrap/glibc.bst
  type: runtime
- filename: bootstrap/elfutils.bst
  type: runtime

variables:
  make-args: >-
    CC='%{triplet}-gcc'
    CFLAGS="${CFLAGS}"
    CXXFLAGS="${CXXFLAGS}"
    LDFLAGS="${LDFLAGS}"

config:
  build-commands:
  - |
    make %{make-args}

  install-commands:
  - |
    make %{make-args} -j1 install DESTDIR="%{install-root}"


public:
  bst:
    split-rules:
      devel:
        (>):
        - "/**"

sources:
- kind: git_tag
  track: master
  url: sourceware:dwz.git
  ref: dwz-0.14-0-g24a051690bf2f016f0c961026de0895997ceee3a
