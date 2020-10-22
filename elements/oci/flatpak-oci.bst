kind: oci

build-depends:
- oci/sdk-oci.bst
- oci/layers/flatpak.bst

# For build time optimization
- oci/layers/sdk.bst

config:
  mode: oci
  gzip: False
  images:
  - os: linux
    architecture: "%{go-arch}"
    parent:
      element: oci/sdk-oci.bst
    layer:
    - oci/layers/flatpak.bst
    comment: "Import flatpak"
