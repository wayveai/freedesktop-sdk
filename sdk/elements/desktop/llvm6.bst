kind: cmake

depends:
  - filename: bootstrap-import.bst
  - filename: base/cmake.bst
    type: build
  - filename: base/ninja.bst
    type: build

variables:
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
    -DLLVM_INCLUDE_UTILS:BOOL=OFF \
    -DLLVM_INCLUDE_DOCS:BOOL=OFF \
    -DLLVM_ENABLE_DOXYGEN:BOOL=OFF \
    -DLLVM_BUILD_EXTERNAL_COMPILER_RT:BOOL=ON \
    -DFFI_INCLUDE_DIR=%{libdir}/libffi-3.2.1/include \
    -DLLVM_INSTALL_TOOLCHAIN_ONLY:BOOL=OFF \
    -DLLVM_TARGETS_TO_BUILD="%{targets}"

config:
  install-commands:
    (>):
      - |
        rm -f "%{install-root}%{libdir}"/lib*.a

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{bindir}/**'
        - '%{libdir}/libLLVM-6.0.0.so'
        - '%{libdir}/libLLVM.so'
        - '%{libdir}/libLTO.so'

sources:
  - kind: tar
    url: http://releases.llvm.org/6.0.0/llvm-6.0.0.src.tar.xz
    ref: 1ff53c915b4e761ef400b803f07261ade637b0c269d99569f18040f3dcee4408
