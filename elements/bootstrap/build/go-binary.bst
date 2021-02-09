kind: stack

# FIXME: We should add go to PreBootstrap so we can get rid of this

(?):
- bootstrap_build_arch == "x86_64":
    runtime-depends:
    - bootstrap/build/go-binary-amd64.bst
- bootstrap_build_arch == "aarch64":
    runtime-depends:
    - bootstrap/build/go-binary-arm64.bst
- bootstrap_build_arch == "ppc64le":
    runtime-depends:
    - bootstrap/build/go-binary-ppc64le.bst
