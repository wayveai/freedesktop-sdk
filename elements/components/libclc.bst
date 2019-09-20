kind: manual

depends:
- filename: bootstrap-import.bst
- filename: components/llvm.bst
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

(@): elements/include/llvm.yml
