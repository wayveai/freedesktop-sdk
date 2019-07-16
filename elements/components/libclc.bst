kind: manual

depends:
- filename: bootstrap-import.bst
- filename: components/llvm8.bst
  type: build
- filename: components/llvm8-static.bst
  type: build
- filename: components/python3.bst
  type: build

config:
  configure-commands:
  - |
    cd libclc
    ./configure.py \
    --prefix=%{prefix} \
    --pkgconfigdir=%{libdir}/pkgconfig \
    --with-cxx-compiler=%{bindir}/g++

  build-commands:
  - |
    cd libclc
    make

  install-commands:
  - |
    cd libclc
    make -j1 DESTDIR="%{install-root}" install

sources:
- kind: git_tag
  track: release/8.x
  exclude:
  - llvmorg-*-rc*
  url: github:llvm/llvm-project.git
  ref: llvmorg-8.0.0-0-gd2298e74235598f15594fe2c99bbac870a507c59
- kind: patch
  directory: libclc
  path: patches/libclc/libclc-force-configure-to-use-python3.patch
