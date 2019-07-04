kind: oci

depends:
- filename: oci/bootstrap-oci.bst
  type: build
- filename: oci/layers/sdk.bst
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
    comment: "Import SDK layer from Freedesktop SDK"
    tags:
    - freedesktopsdk/sdk:latest
