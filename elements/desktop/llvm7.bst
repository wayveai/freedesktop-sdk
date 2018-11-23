kind: cmake

depends:
- filename: bootstrap-import.bst
  type: build
- filename: base/libffi.bst
  type: build
- filename: base/buildsystem-cmake.bst
  type: build

variables:
  clang-libs: |
    libclangAnalysis.a \
    libclangAST.a \
    libclangBasic.a \
    libclangCodeGen.a \
    libclangDriver.a \
    libclangEdit.a \
    libclangFrontend.a \
    libclangFrontendTool.a \
    libclangLex.a \
    libclangParse.a \
    libclangSema.a \
    libclangSerialization.a

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
    -DLLVM_TARGETS_TO_BUILD="%{targets}"

environment:
  (?):
  - target_arch == "x86_64":
      JOBS: -j2

config:
  install-commands:
    (>):
    - |
      cd "%{install-root}%{libdir}"
      mkdir tmp
      mv %{clang-libs} tmp
      rm -f lib*.a
      mv tmp/* "%{install-root}%{libdir}"
      rm -rf tmp

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
        - '%{libdir}/libLLVM-7.0.0.so'
        - '%{libdir}/libLLVM.so'
        - '%{libdir}/LLVMgold.so'
        - '%{libdir}/LLVMHello.so'
        - '%{libdir}/libLTO.so'
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
  url: https://releases.llvm.org/7.0.0/llvm-7.0.0.src.tar.xz
  ref: 8bc1f844e6cbde1b652c19c1edebc1864456fd9c78b8c1bea038e51b363fe222
- kind: tar
  url: https://releases.llvm.org/7.0.0/cfe-7.0.0.src.tar.xz
  ref: 550212711c752697d2f82c648714a7221b1207fd9441543ff4aa9e3be45bba55
  directory: tools/clang
- kind: tar
  url: https://releases.llvm.org/7.0.0/compiler-rt-7.0.0.src.tar.xz
  ref: bdec7fe3cf2c85f55656c07dfb0bd93ae46f2b3dd8f33ff3ad6e7586f4c670d6
  directory: tools/compiler-rt
