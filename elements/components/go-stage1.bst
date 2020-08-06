kind: stack

(?):
- target_arch == "x86_64":
    runtime-depends:
    - components/go-stage1-amd64.bst
- target_arch == "i686":
    runtime-depends:
    - components/go-stage1-386.bst
- target_arch == "aarch64":
    runtime-depends:
    - components/go-stage1-arm64.bst
- target_arch == "arm":
    runtime-depends:
    - components/go-stage1-armv6l.bst
- target_arch == "ppc64le":
    runtime-depends:
    - components/go-stage1-ppc64le.bst
