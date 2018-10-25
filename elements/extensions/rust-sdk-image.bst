kind: compose
description: Composes dependencies into the image to be exported

variables:
  prefix: /usr/lib/sdk/rust
  lib: lib
  debugdir: /usr/lib/debug

depends:
- filename: extensions/rust/rust.bst
  type: build
- filename: extensions/rust/cargo.bst
  type: build
