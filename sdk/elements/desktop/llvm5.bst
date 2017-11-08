kind: cmake

depends:
  - filename: base-stack.bst
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
        targets: "ARM;AMDGPU;NVPTX"
    - target_arch == "aarch64":
        targets: "AArch64;AMDGPU;NVPTX"

  cmake-extra: |
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

config:
  configure-commands:
  - |
    mkdir build
    cd build
    cmake .. %{cmake-args}

  build-commands:
  - |
    cd build
    %{make}

  install-commands:
  - |
    cd build
    %{make-install}

sources:
  - kind: tar
    url: http://llvm.org/releases/5.0.0/llvm-5.0.0.src.tar.xz
    ref: e35dcbae6084adcf4abb32514127c5eabd7d63b733852ccdb31e06f1373136da
