kind: compose

description: Composes the platform image with the library headers, to check its ABI.

depends:
- filename: desktop-platform-image.bst
  type: build
- filename: abi/desktop-lib-headers.bst
  type: build
