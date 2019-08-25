kind: manual

depends:
- filename: bootstrap-import.bst
- filename: components/llvm.bst
  type: build
- filename: components/llvm-static.bst
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
  ref: llvmorg-8.0.1-0-g19a71f6bdf2dddb10764939e7f0ec2b98dba76c9
- kind: patch
  directory: libclc
  path: patches/libclc/libclc-force-configure-to-use-python3.patch
