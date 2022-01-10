kind: stack

depends:
- flatpak-release.bst
- abi/freedesktop-sdk
- bootstrap/build/base-sdk/image-aarch64.bst
# - bootstrap/build/base-sdk/image-ppc64le.bst ppc64le needs to be recreated
- bootstrap/build/base-sdk/image-x86_64.bst
