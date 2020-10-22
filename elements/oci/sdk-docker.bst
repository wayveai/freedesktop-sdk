kind: oci

build-depends:
- oci/platform-oci.bst
- oci/layers/sdk.bst

# For build time optimization
- oci/layers/platform.bst

config:
  mode: docker
  images:
  - os: linux
    architecture: "%{go-arch}"
    parent:
      element: oci/platform-oci.bst
    layer:
    - oci/layers/sdk.bst
    comment: "Import SDK layer from Freedesktop SDK"
    tags:
    - freedesktopsdk/sdk:latest
