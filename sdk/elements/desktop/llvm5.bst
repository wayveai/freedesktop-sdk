kind: cmake

depends:
  - filename: base.bst
    type: build
  - filename: desktop/xorg-proto-x.bst
  - filename: desktop/xorg-lib-x11.bst
  - filename: desktop/xorg-lib-xrandr.bst
  - filename: desktop/wayland.bst

variables:
  # Building llvm5 takes a lot of memory
  max-jobs: 2
  lib: "lib/%{gcc_triplet}"
  libdir: "%{prefix}/lib/%{gcc_triplet}"
  (?):
    - target_arch == "i586":
        targets: "X86;AMDGPU;NVPTX"
    - target_arch == "x86_64":
        targets: "X86;AMDGPU;NVPTX"
    - target_arch == "arm":
        targets: "ARM"
    - target_arch == "aarch64":
        targets: "AArch64"

  cmake-local: |
    -DLLVM_ENABLE_ASSERTIONS:BOOL=OFF \
    -DBUILD_SHARED_LIBS:BOOL=OFF \
    -DCMAKE_VERBOSE_MAKEFILE:BOOL=ON \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DLLVM_LIBDIR_SUFFIX= \
    -DLLVM_ENABLE_LIBCXX:BOOL=OFF \
    -DLLVM_ENABLE_ZLIB:BOOL=ON \
    -DLLVM_ENABLE_FFI:BOOL=ON \
    -DLLVM_BUILD_TESTS:BOOL=OFF \
    -DLLVM_INCLUDE_EXAMPLES:BOOL=OFF \
    -DLLVM_BUILD_EXAMPLES:BOOL=OFF \
    -DLLVM_INCLUDE_UTILS:BOOL=ON \
    -DLLVM_INSTALL_UTILS:BOOL=ON \
    -DLLVM_INCLUDE_DOCS:BOOL=OFF \
    -DLLVM_ENABLE_DOXYGEN:BOOL=OFF \
    -DLLVM_BUILD_LLVM_DYLIB:BOOL=OFF \
    -DLLVM_BUILD_EXTERNAL_COMPILER_RT:BOOL=ON \
    -DFFI_INCLUDE_DIR=%{libdir}/libffi-3.2.1/include \
    -DLLVM_INSTALL_TOOLCHAIN_ONLY:BOOL=OFF \
    -DLLVM_TARGETS_TO_BUILD="%{targets}"

sources:
  - kind: tar
    url: http://releases.llvm.org/5.0.1/llvm-5.0.1.src.tar.xz
    ref: 5fa7489fc0225b11821cab0362f5813a05f2bcf2533e8a4ea9c9c860168807b0
