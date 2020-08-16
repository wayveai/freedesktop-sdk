kind: url_manifest

build-depends:
  - flatpak-release.bst
  - components.bst
  - components/go-stage1-386.bst
  - components/go-stage1-amd64.bst
  - components/go-stage1-arm64.bst
  - components/go-stage1-armv6l.bst
  - components/go-stage1-ppc64le.bst
  - extensions/rust/rust-stage1-x86-64.bst
  - extensions/rust/rust-stage1-i686.bst
  - extensions/rust/rust-stage1-aarch64.bst
  - extensions/rust/rust-stage1-armv7.bst
  - extensions/rust/rust-stage1-powerpc64le.bst
  - oci/layers/flatpak.bst
  - oci/layers/debug.bst
  - oci/layers/platform.bst
  - oci/layers/sdk.bst

config:
  path: "/url-manifest-no-mirrors.json"
