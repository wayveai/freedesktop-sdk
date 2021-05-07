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
  ref: dwz-0.14-0-g24a051690bf2f016f0c961026de0895997ceee3a
