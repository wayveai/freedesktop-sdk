kind: oci

build-depends:
- oci/sdk-oci.bst
- oci/layers/debug.bst

# For build time optimization
- oci/layers/sdk.bst

config:
  mode: docker
  images:
  - os: linux
    architecture: "%{go-arch}"
    parent:
      element: oci/sdk-oci.bst
    layer:
    - oci/layers/debug.bst
    comment: "Import debug layer from Freedesktop SDK"
    tags:
    - freedesktopsdk/debug:latest
