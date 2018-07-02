kind: compose

variables:
  prefix: "/usr/lib/sdk/rust"
  lib: "lib"
  debugdir: "/usr/lib/debug"

depends:
- filename: rust/rust.bst
  type: build
- filename: rust/cargo.bst
  type: build
