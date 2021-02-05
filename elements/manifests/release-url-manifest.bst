kind: url_manifest

build-depends:
  - flatpak-release.bst
  - components.bst
  - bootstrap/build/go-binary-amd64.bst
  - bootstrap/build/go-binary-arm64.bst
  - bootstrap/build/go-binary-ppc64le.bst
  - components/rust-stage1-x86-64.bst
  - components/rust-stage1-i686.bst
  - components/rust-stage1-aarch64.bst
  - components/rust-stage1-armv7.bst
  - components/rust-stage1-powerpc64le.bst
  - oci/layers/flatpak.bst
  - oci/layers/debug.bst
  - oci/layers/platform.bst
  - oci/layers/sdk.bst

config:
  path: "/url-manifest-no-mirrors.json"
