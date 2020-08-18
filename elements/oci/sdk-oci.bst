kind: oci

build-depends:
- oci/platform-oci.bst
- oci/layers/sdk.bst

# For build time optimization
- oci/layers/platform.bst

config:
  mode: oci
  gzip: False
  images:
  - os: linux
    architecture: "%{go-arch}"
    parent:
      element: oci/platform-oci.bst
    layer:
    - oci/layers/sdk.bst
    comment: "Import sdk layer from Freedesktop SDK"
