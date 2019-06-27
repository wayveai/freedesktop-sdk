kind: oci

depends:
- filename: oci/bootstrap-oci.bst
  type: build
- filename: oci/layers/platform.bst
  type: build

config:
  mode: docker
  images:
  - os: linux
    architecture: "%{go-arch}"
    parent:
      element: oci/bootstrap-oci.bst
    layer:
    - oci/layers/platform.bst
    comment: "Import platform layer from Freedesktop SDK"
    tags:
    - freedesktopsdk/platform:latest
