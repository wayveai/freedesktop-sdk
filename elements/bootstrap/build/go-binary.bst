kind: stack

# FIXME: We should add go to PreBootstrap so we can get rid of this

(?):
- bootstrap_build_arch == "x86_64":
    depends:
    - bootstrap/build/go-binary-amd64.bst
- bootstrap_build_arch == "aarch64":
    depends:
    - bootstrap/build/go-binary-arm64.bst
