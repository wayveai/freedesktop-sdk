kind: stack

(?):
- target_arch == "x86_64":
    depends:
    - flatpak-images/toolchain-aarch64.bst
    - flatpak-images/toolchain-arm.bst
    - flatpak-images/toolchain-i686.bst
