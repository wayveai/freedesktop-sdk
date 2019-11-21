kind: stack

(?):
- target_arch in ["x86_64", "i686", "arm", "aarch64"]:
    depends:
    - components/gnu-efi.bst
