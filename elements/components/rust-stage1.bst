kind: stack

(?):
- target_arch == "x86_64":
    runtime-depends:
    - components/rust-stage1-x86-64.bst
- target_arch == "i686":
    runtime-depends:
    - components/rust-stage1-i686.bst
- target_arch == "aarch64":
    runtime-depends:
    - components/rust-stage1-aarch64.bst
- target_arch == "arm":
    runtime-depends:
    - components/rust-stage1-armv7.bst
- target_arch == "ppc64le":
    runtime-depends:
    - components/rust-stage1-powerpc64le.bst
