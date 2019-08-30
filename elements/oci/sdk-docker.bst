kind: oci

depends:
- filename: oci/platform-oci.bst
  type: build
- filename: oci/layers/sdk.bst
  type: build
- filename: integration/linker-debuginfo.bst
  type: build

# For build time optimization
- filename: oci/layers/platform.bst
  type: build

config:
  mode: docker
  images:
  - os: linux
    architecture: "%{go-arch}"
    parent:
      element: oci/platform-oci.bst
    layer:
    - oci/layers/sdk.bst
    - integration/linker-debuginfo.bst
    comment: "Import SDK layer from Freedesktop SDK"
    tags:
    - freedesktopsdk/sdk:latest
