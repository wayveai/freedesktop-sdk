kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst
- components/libffi.bst

depends:
- extensions/mesa/ldconfig.bst

runtime-depends:
- extensions/mesa/llvm-bindir-compat.bst

environment:
  # Work-around issue building compiler-rt with multiarch
  LD_LIBRARY_PATH: '%{build-root}/%{build-dir}/lib'

(@):
- elements/extensions/mesa/config.yml

variables:
  cmake: |
    cmake -B%{build-dir} -Hllvm -G"%{generator}" %{cmake-args}

  debug_flags: "-g1"
  optimize-debug: "false"

  (?):
  - target_arch == "i686":
      targets: X86;AMDGPU;NVPTX
  - target_arch == "x86_64":
      targets: X86;AMDGPU;NVPTX
  - target_arch == "arm":
      targets: ARM
  - target_arch == "aarch64":
      targets: AArch64
  - target_arch == "ppc64le":
      targets: PowerPC;AMDGPU

  cmake-local: >-
    -DLLVM_ENABLE_PROJECTS='clang;compiler-rt'
    -DLLVM_ENABLE_ASSERTIONS:BOOL=OFF
    -DBUILD_SHARED_LIBS:BOOL=OFF
    -DLLVM_BUILD_LLVM_DYLIB:BOOL=ON
    -DLLVM_LINK_LLVM_DYLIB:BOOL=ON
    -DCMAKE_BUILD_TYPE=RelWithDebInfo
    -DLLVM_LIBDIR_SUFFIX=""
    -DLLVM_ENABLE_LIBCXX:BOOL=OFF
    -DLLVM_ENABLE_ZLIB:BOOL=ON
    -DLLVM_ENABLE_FFI:BOOL=ON
    -DLLVM_ENABLE_RTTI:BOOL=ON
    -DLLVM_INCLUDE_TESTS:BOOL=OFF
    -DLLVM_INCLUDE_EXAMPLES:BOOL=OFF
    -DLLVM_INCLUDE_UTILS:BOOL=ON
    -DLLVM_INSTALL_UTILS:BOOL=ON
    -DLLVM_INCLUDE_DOCS:BOOL=OFF
    -DLLVM_ENABLE_DOXYGEN:BOOL=OFF
    -DLLVM_BUILD_EXTERNAL_COMPILER_RT:BOOL=ON
    -DLLVM_BINUTILS_INCDIR=%{includedir}
    -DFFI_INCLUDE_DIR=/usr/lib/%{gcc_triplet}/libffi-3.2.1/include
    -DLLVM_INSTALL_TOOLCHAIN_ONLY:BOOL=OFF
    -DLLVM_DEFAULT_TARGET_TRIPLE=%{build-triplet}
    -DLLVM_TARGETS_TO_BUILD="%{targets}"
    -DCMAKE_C_FLAGS_RELWITHDEBINFO="-DNDEBUG"
    -DCMAKE_CXX_FLAGS_RELWITHDEBINFO="-DNDEBUG"

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{bindir}/**'
        - '%{libexecdir}/**'
        - '%{libdir}/libLLVM.so'
        - '%{libdir}/libLLVM-*.*.*.so'
        - '%{libdir}/LLVMgold.so'
        - '%{libdir}/libLTO.so*'
        - '%{libdir}/libRemarks.so'
        - '%{libdir}/libclang.so'
        - '%{libdir}/libclang-cpp.so'
        - '%{libdir}/libOptRemarks.so'
        - '%{libdir}/clang/*/include'
        - '%{libdir}/clang/*/include/**'
        - '%{libdir}/clang/*/lib/**/*.a'
        - '%{libdir}/clang/*/lib/**/*.a.syms'
        - '%{libdir}/clang/*/lib/**/*.o'
        - '%{datadir}/clang'
        - '%{datadir}/clang/**'
        - '%{datadir}/opt-viewer'
        - '%{datadir}/opt-viewer/**'
        - '%{datadir}/scan-build'
        - '%{datadir}/scan-build/**'
        - '%{datadir}/scan-view'
        - '%{datadir}/scan-view/**'
sources:
- kind: git_tag
  track: release/11.x
  exclude:
  - llvmorg-*-rc*
  url: github:llvm/llvm-project.git
  ref: llvmorg-11.1.0-0-g1fdec59bffc11ae37eb51a1b9869f0696bfd5312
- kind: patch
  path: patches/llvm/llvm-no-rpath.patch
- kind: patch
  path: patches/llvm/llvm-fix-tsan-build.patch
- kind: patch
  path: patches/llvm/llvm-shared-tablegen.patch
