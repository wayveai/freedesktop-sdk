kind: stack

(?):
- target_arch == "x86_64":
    depends:
    - multiarch/multiarch-arm.bst
    - multiarch/multiarch-aarch64.bst
    - multiarch/multiarch-i686.bst
- (target_arch == "arm") or (target_arch == "aarch64"):
    depends:
    - multiarch/multiarch-arm.bst
    - multiarch/multiarch-aarch64.bst
- target_arch == "i686":
    depends:
    - multiarch/multiarch-i686.bst
