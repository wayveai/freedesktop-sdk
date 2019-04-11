kind: stack

(?):
- target_arch == "x86_64":
    depends:
    - multiarch-i686.bst
- (target_arch == "arm") or (target_arch == "aarch64"):
    depends:
    - multiarch-arm.bst
    - multiarch-aarch64.bst
- target_arch == "i686":
    depends:
    - multiarch-i686.bst
