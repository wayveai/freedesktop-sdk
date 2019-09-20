kind: cmake

depends:
- filename: bootstrap-import.bst
  type: build
- filename: components/libffi.bst
  type: build
- filename: public-stacks/buildsystem-cmake.bst
  type: build

variables:
  prefix: /usr/lib/sdk/rust
  lib: lib
  debugdir: /usr/lib/debug
  cmake: |
    cmake -B%{build-dir} -Hllvm -G"%{generator}" %{cmake-args}

  debug_flags: "-g1"
  optimize-debug: "false"

  (?):
  - target_arch == "i686":
      targets: X86
  - target_arch == "x86_64":
      targets: X86
  - target_arch == "arm":
      targets: ARM
  - target_arch == "aarch64":
      targets: AArch64
  - target_arch == "powerpc64le":
      targets: PowerPC

  cmake-local: >-
    -DLLVM_ENABLE_PROJECTS=''
    -DLLVM_ENABLE_ASSERTIONS:BOOL=OFF
    -DBUILD_SHARED_LIBS:BOOL=OFF
    -DLLVM_BUILD_LLVM_DYLIB:BOOL=ON
    -DLLVM_LINK_LLVM_DYLIB:BOOL=ON
    -DCMAKE_BUILD_TYPE=RelWithDebInfo
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

config:
  install-commands:
    (>):
    - |
      find "%{install-root}%{libdir}" -name "*.a.syms" -exec rm {} ";"

    - |
      find "%{install-root}%{libdir}" -name "*.a" -exec rm {} ";"

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
        - '%{libdir}/libLLVM-*.*.*.so'
        - '%{libdir}/libLLVM.so'
        - '%{libdir}/libLLVMTableGen.so'
        - '%{libdir}/LLVMgold.so'
        - '%{libdir}/LLVMHello.so'
        - '%{libdir}/libLTO.so*'
        - '%{libdir}/libclang.so'
        - '%{libdir}/BugpointPasses.so'
        - '%{libdir}/libOptRemarks.so'
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
- kind: git_tag
  track: release/8.x
  exclude:
  - llvmorg-*-rc*
  url: github:llvm/llvm-project.git
  ref: llvmorg-8.0.1-0-g19a71f6bdf2dddb10764939e7f0ec2b98dba76c9
- kind: patch
  path: patches/llvm/llvm-clang-ignore-fstack-clash-protection.patch
- kind: patch
  path: patches/llvm/llvm-no-rpath.patch
- kind: patch
  path: patches/llvm/llvm-fix-tsan-build.patch
- kind: patch
  path: patches/llvm/llvm-shared-tablegen.patch
