kind: oci

depends:
- filename: oci/layers/bootstrap.bst
  type: build

config:
  mode: oci
  images:
  - os: linux
    architecture: "%{go-arch}"
    layer:
    - oci/layers/bootstrap.bst
    comment: "Import bootstrap layer from Freedesktop SDK"
