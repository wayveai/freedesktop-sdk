kind: cmake

depends:
- filename: bootstrap-import.bst
  type: build
- filename: base/libffi.bst
  type: build
- filename: base/buildsystem-cmake.bst
  type: build

variables:
  debug_flags: "-g1"

  (?):
  - target_arch == "i686":
      targets: X86;AMDGPU;NVPTX
  - target_arch == "x86_64":
      targets: X86;AMDGPU;NVPTX
  - target_arch == "arm":
      targets: ARM
  - target_arch == "aarch64":
      targets: AArch64

  cmake-local: |
    -DLLVM_ENABLE_ASSERTIONS:BOOL=OFF \
    -DBUILD_SHARED_LIBS:BOOL=OFF \
    -DLLVM_BUILD_LLVM_DYLIB:BOOL=ON \
    -DLLVM_DYLIB_SYMBOL_VERSIONING:BOOL=ON \
    -DLLVM_LINK_LLVM_DYLIB:BOOL=ON \
    -DCMAKE_VERBOSE_MAKEFILE:BOOL=ON \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DLLVM_LIBDIR_SUFFIX="/%{gcc_triplet}" \
    -DLLVM_ENABLE_LIBCXX:BOOL=OFF \
    -DLLVM_ENABLE_ZLIB:BOOL=ON \
    -DLLVM_ENABLE_FFI:BOOL=ON \
    -DLLVM_ENABLE_RTTI:BOOL=ON \
    -DLLVM_INCLUDE_TESTS:BOOL=OFF \
    -DLLVM_INCLUDE_EXAMPLES:BOOL=OFF \
    -DLLVM_INCLUDE_UTILS:BOOL=ON \
    -DLLVM_INSTALL_UTILS:BOOL=ON \
    -DLLVM_INCLUDE_DOCS:BOOL=OFF \
    -DLLVM_ENABLE_DOXYGEN:BOOL=OFF \
    -DLLVM_BUILD_EXTERNAL_COMPILER_RT:BOOL=ON \
    -DLLVM_BINUTILS_INCDIR=%{includedir} \
    -DFFI_INCLUDE_DIR=%{libdir}/libffi-3.2.1/include \
    -DLLVM_INSTALL_TOOLCHAIN_ONLY:BOOL=OFF \
    -DLLVM_DEFAULT_TARGET_TRIPLE=%{build-triplet} \
    -DLLVM_TARGETS_TO_BUILD="%{targets}" \
    -DCMAKE_C_FLAGS_RELWITHDEBINFO="-DNDEBUG" \
    -DCMAKE_CXX_FLAGS_RELWITHDEBINFO="-DNDEBUG"

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{debugdir}%{bindir}/**'
        - '%{debugdir}%{libdir}/LLVMHello.so.debug'
        - '%{debugdir}%{libdir}/LLVMgold.so.debug'
        - '%{debugdir}%{libdir}/BugpointPasses.so.debug'
        - '%{bindir}/**'
        - '%{libexecdir}/**'
        - '%{libdir}/libLLVM-7.0.1.so'
        - '%{libdir}/libLLVM.so'
        - '%{libdir}/LLVMgold.so'
        - '%{libdir}/LLVMHello.so'
        - '%{libdir}/libLTO.so*'
        - '%{libdir}/libclang.so'
        - '%{libdir}/BugpointPasses.so'
        - '%{libdir}/clang'
        - '%{libdir}/clang/**'
        - '%{datadir}/clang'
        - '%{datadir}/clang/**'
        - '%{datadir}/opt-viewer'
        - '%{datadir}/opt-viewer/**'
        - '%{datadir}/scan-build'
        - '%{datadir}/scan-build/**'
        - '%{datadir}/scan-view'
        - '%{datadir}/scan-view/**'
      
      static:
        - '%{libdir}/*.a'

sources:
- kind: tar
  url: tar_https:releases.llvm.org/7.0.1/llvm-7.0.1.src.tar.xz
  ref: a38dfc4db47102ec79dcc2aa61e93722c5f6f06f0a961073bd84b78fb949419b
- kind: tar
  url: tar_https:releases.llvm.org/7.0.1/cfe-7.0.1.src.tar.xz
  ref: a45b62dde5d7d5fdcdfa876b0af92f164d434b06e9e89b5d0b1cbc65dfe3f418
  directory: tools/clang
- kind: tar
  url: tar_https:releases.llvm.org/7.0.1/compiler-rt-7.0.1.src.tar.xz
  ref: 782edfc119ee172f169c91dd79f2c964fb6b248bd9b73523149030ed505bbe18
  directory: tools/compiler-rt
- kind: patch
  path: patches/llvm/llvm-clang-ignore-fstack-clash-protection.patch
- kind: patch
  path: patches/llvm/llvm7-no-rpath.patch
- kind: patch
  path: patches/llvm/llvm7-debuginfo-rustc-1.patch
- kind: patch
  path: patches/llvm/llvm7-debuginfo-rustc-2.patch
