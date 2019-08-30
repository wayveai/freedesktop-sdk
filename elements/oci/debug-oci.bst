kind: oci

depends:
- filename: oci/sdk-oci.bst
  type: build
- filename: oci/layers/debug.bst
  type: build

# For build time optimization
- filename: oci/layers/sdk.bst
  type: build
- filename: integration/linker-debuginfo.bst
  type: build

config:
  mode: oci
  gzip: False
  images:
  - os: linux
    architecture: "%{go-arch}"
    parent:
      element: oci/sdk-oci.bst
    layer:
    - oci/layers/debug.bst
    comment: "Import debug layer from Freedesktop SDK"
