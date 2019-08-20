kind: manual

(@): elements/bootstrap/include/build.yml

depends:
- filename: bootstrap/build/base-sdk.bst
  type: build
- filename: bootstrap/gnu-config.bst
  type: build

variables:
  make-args: >-
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

sources:
- kind: git_tag
  track: master
  url: sourceware:dwz.git
  ref: dwz-0.12-0-gbe35c03955bcf6e4e4a1cab1af46bb4e729284b3
