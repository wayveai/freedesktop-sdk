kind: oci

depends:
- filename: oci/bootstrap-oci.bst
  type: build
- filename: oci/layers/debug.bst
  type: build

config:
  mode: oci
  images:
  - os: linux
    architecture: "%{go-arch}"
    parent:
      element: oci/platform-oci.bst
    layer:
    - oci/layers/debug.bst
    comment: "Import debug layer from Freedesktop SDK"
