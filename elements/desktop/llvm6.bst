kind: cmake

depends:
- filename: bootstrap-import.bst
- filename: base/libffi.bst
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

config:
  install-commands:
    (>):
    - |
      rm -f "%{install-root}%{libdir}/"*.a
    - |
      cd "%{install-root}%{libdir}"
      sed -i '/APPEND _IMPORT_CHECK_TARGETS LLVM.*/ d' cmake/llvm/LLVMExports*.cmake

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{bindir}/**'
        - '%{libexecdir}/**'
        - '%{libdir}/libLLVM-6.0.1.so'
        - '%{libdir}/libLLVM.so'
        - '%{libdir}/LLVMgold.so'
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

sources:
- kind: tar
  url: tar_https:releases.llvm.org/6.0.1/llvm-6.0.1.src.tar.xz
  ref: b6d6c324f9c71494c0ccaf3dac1f16236d970002b42bb24a6c9e1634f7d0f4e2
- kind: tar
  url: tar_https:releases.llvm.org/6.0.1/cfe-6.0.1.src.tar.xz
  ref: 7c243f1485bddfdfedada3cd402ff4792ea82362ff91fbdac2dae67c6026b667
  directory: tools/clang
- kind: tar
  url: tar_https:releases.llvm.org/6.0.1/compiler-rt-6.0.1.src.tar.xz
  ref: f4cd1e15e7d5cb708f9931d4844524e4904867240c306b06a4287b22ac1c99b9
  directory: tools/compiler-rt
- kind: patch
  path: patches/llvm/llvm-clang-ignore-fstack-clash-protection.patch
- kind: patch
  path: patches/llvm/llvm6-clang-ignore-fcf-protection.patch
- kind: patch
  path: patches/llvm/llvm6-no-rpath.patch
